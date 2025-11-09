use anyhow::Result;
use mlua::prelude::*;
use notify_debouncer_mini::{DebouncedEvent, DebouncedEventKind, Debouncer, new_debouncer};
use std::{
    fs,
    path::{Path, PathBuf},
    sync::{Arc, Mutex, Weak},
    time::Duration,
};

use crate::lua_modules::{emevd, memory, tasks};

pub fn is_entrypoint(path: &Path) -> bool {
    path.to_str().unwrap().ends_with(".glint.lua")
}

pub struct Script {
    path: PathBuf,
    environment: LuaTable,
}

pub struct ScriptContext {
    lua: Lua,
    scripts: Vec<Script>,
    debounced_watcher: Debouncer<notify::RecommendedWatcher>,
}

impl ScriptContext {
    pub fn new() -> Arc<Mutex<Self>> {
        Arc::new_cyclic(|weak_script_context: &Weak<Mutex<Self>>| {
            let weak_script_context = Weak::clone(weak_script_context);
            Mutex::new(Self {
                lua: Lua::new(),
                scripts: Vec::new(),
                debounced_watcher: new_debouncer(Duration::from_millis(100), move |events| {
                    if let Some(script_context) = weak_script_context.upgrade() {
                        let mut script_context = script_context.lock().unwrap();
                        script_context.handle_fs_notifications(events);
                    }
                })
                .unwrap(),
            })
        })
    }

    /**
     * Add the modding APIs to the global environment table
     */
    pub fn register_apis(self: &Self) -> LuaResult<()> {
        memory::register(&self.lua)?;
        emevd::register(&self.lua)?;
        tasks::register(&self.lua)
    }

    /**
     * Load any entrypoints in the given directory ending in ".glint.lua", and watch it for changes
     */
    pub fn add_dir(&mut self, dir_path: &Path) -> Result<()> {
        println!("Loading scripts from {}", dir_path.display());

        if let Ok(entries) = fs::read_dir(dir_path) {
            for entry in entries {
                let entry = entry?;
                if is_entrypoint(&entry.path()) {
                    if let Err(e) = self.load_entrypoint(&entry.path()) {
                        println!("{}", e);
                    }
                }
            }
        }

        self.debounced_watcher
            .watcher()
            .watch(dir_path, notify::RecursiveMode::NonRecursive)?;

        Ok(())
    }

    /**
     * Check for modified scripts to hot reload
     */
    fn handle_fs_notifications(&mut self, events: notify::Result<Vec<DebouncedEvent>>) {
        let Ok(events) = events else { return };

        for event in events {
            if event.kind == DebouncedEventKind::Any && is_entrypoint(&event.path) {
                if let Err(e) = self.load_entrypoint(&event.path) {
                    println!("{}", e);
                }
            }
        }
    }

    /**
     * Evaluate a script, either with a new environment or the environment it was previously
     * loaded with, and add it to the list of loaded scripts
     */
    fn load_entrypoint(&mut self, path: &Path) -> LuaResult<()> {
        let contents = fs::read_to_string(path)?;

        let eval = |environment: &LuaTable| -> LuaResult<()> {
            let chunk = self
                .lua
                .load(&contents)
                .set_name(format!("@{}", path.display()));

            chunk.set_environment(environment.clone()).eval()
        };

        match self.scripts.iter_mut().find(|s| s.path == path) {
            None => {
                println!("Loading {}", path.display());

                let path = path.to_path_buf();

                let environment = self.lua.create_table()?;
                let metatable = self.lua.create_table()?;
                metatable.set("__index", self.lua.globals())?;
                environment.set_metatable(Some(metatable))?;

                eval(&environment)?;

                self.scripts.push(Script { path, environment });
            }
            Some(script) => {
                println!("Reloading {}", path.display());

                // Remove any existing registered callbacks from the same script to prevent
                // duplicates
                tasks::drop_environment(&self.lua, &script.environment);

                // Re-evaluate the script
                eval(&script.environment)?;
            }
        }

        Ok(())
    }
}
