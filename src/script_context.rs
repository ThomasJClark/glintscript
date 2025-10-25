use anyhow::Result;
use mlua::prelude::*;
use std::{
    fs,
    path::{Path, PathBuf},
    sync::mpsc::{Receiver, channel},
    time::Duration,
};

use crate::lua_modules;

pub fn is_entrypoint(path: &Path) -> bool {
    path.to_str().unwrap().ends_with(".glint.lua")
}

pub struct Script {
    path: PathBuf,
    function: LuaFunction,
    environment: LuaTable,
}

pub struct ScriptContext {
    lua: Lua,
    scripts: Vec<Script>,
    debouncer: notify_debouncer_mini::Debouncer<notify::RecommendedWatcher>,
    receiver: Receiver<notify_debouncer_mini::DebouncedEvent>,
}

impl ScriptContext {
    pub fn new() -> Result<Self> {
        let lua = Lua::new();

        // Create global Lua tables for the modding APIs
        let globals = lua.globals();
        globals.set("Memory", lua_modules::memory::create(&lua)?)?;
        globals.set("EMEVD", lua_modules::emevd::create(&lua)?)?;

        let (tx, rx) = channel();

        Ok(Self {
            lua,
            scripts: Vec::new(),
            debouncer: notify_debouncer_mini::new_debouncer(
                Duration::from_millis(100),
                move |events: notify::Result<Vec<notify_debouncer_mini::DebouncedEvent>>| {
                    for event in events.unwrap() {
                        tx.send(event).unwrap();
                    }
                },
            )?,
            receiver: rx,
        })
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
                    self.load_entrypoint(&entry.path())?;
                }
            }
        }

        self.debouncer
            .watcher()
            .watch(dir_path, notify::RecursiveMode::NonRecursive)?;

        Ok(())
    }

    /**
     * Updater called each frame. Check for modified scripts to hot reload, and update any returned
     * Lua callbacks
     */
    pub fn update(&mut self) {
        println!("Update");

        if let Err(err) = self.poll_files() {
            println!("{}", err);
        }

        for script in &mut self.scripts {
            if let Err(e) = script.function.call::<()>(()) {
                println!("{}", e);
            }
        }
    }

    /**
     * Evaluate a script, either with a new environment or the environment it was previously
     * loaded with, and add it to the list of loaded scripts
     */
    fn load_entrypoint(&mut self, path: &Path) -> Result<()> {
        let contents = fs::read_to_string(path)?;

        let eval = |environment: &LuaTable| -> Result<LuaFunction> {
            let chunk = self
                .lua
                .load(&contents)
                .set_name(format!("@{}", path.display()));

            let function = chunk
                .set_environment(environment.clone())
                .eval::<LuaFunction>()?;

            function.set_environment(environment.clone())?;

            Ok(function)
        };

        match self.scripts.iter_mut().find(|s| s.path == path) {
            None => {
                println!("Loading {}", path.display());

                let environment = self.lua.create_table()?;
                let metatable = self.lua.create_table()?;
                metatable.set("__index", self.lua.globals())?;
                environment.set_metatable(Some(metatable))?;

                self.scripts.push(Script {
                    path: path.to_path_buf(),
                    function: eval(&environment)?,
                    environment,
                });
            }
            Some(script) => {
                println!("Reloading {}", path.display());
                script.function = eval(&script.environment)?;
            }
        }

        Ok(())
    }

    /**
     * Hot reload an added or modified entrypoint, returning without blocking if there are no
     * changes
     */
    fn poll_files(&mut self) -> Result<()> {
        if let Ok(event) = self.receiver.try_recv() {
            if event.kind == notify_debouncer_mini::DebouncedEventKind::Any
                && is_entrypoint(&event.path)
            {
                self.load_entrypoint(&event.path)?;
            }
        }

        Ok(())
    }
}
