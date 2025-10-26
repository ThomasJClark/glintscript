use anyhow::Result;
use mlua::prelude::*;
use std::{
    fs,
    path::{Path, PathBuf},
    sync::{
        Arc, Mutex,
        mpsc::{Receiver, channel},
    },
    time::Duration,
};

use crate::lua_modules;

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
    debouncer: notify_debouncer_mini::Debouncer<notify::RecommendedWatcher>,
    receiver: Receiver<notify_debouncer_mini::DebouncedEvent>,
    tasks: Arc<Mutex<Vec<LuaFunction>>>,
}

impl ScriptContext {
    pub fn new() -> Result<Self> {
        let (tx, rx) = channel();

        let new = Self {
            lua: Lua::new(),
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
            tasks: Arc::new(Mutex::new(Vec::new())),
        };

        new.create_api()?;

        Ok(new)
    }

    fn create_api(&self) -> LuaResult<()> {
        // Create global Lua tables for the modding APIs
        let globals = self.lua.globals();
        globals.set("Memory", lua_modules::memory::create(&self.lua)?)?;
        globals.set("EMEVD", lua_modules::emevd::create(&self.lua)?)?;
        globals.set("InitializeTask", {
            let tasks = self.tasks.clone();
            self.lua.create_function(move |_, func: LuaFunction| {
                let mut tasks = tasks.lock().unwrap();
                tasks.push(func);
                Ok(())
            })?
        })?;

        Ok(())
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

        self.debouncer
            .watcher()
            .watch(dir_path, notify::RecursiveMode::NonRecursive)?;

        Ok(())
    }

    /**
     * Updater called each frame. Check for modified scripts to hot reload, and update any
     * registered Lua callbacks
     */
    pub fn update(&mut self, delta_time: f32) {
        if let Err(err) = self.poll_files() {
            println!("{}", err);
        }

        for task in self.tasks.lock().unwrap().iter() {
            if let Err(e) = task.call::<()>(delta_time) {
                println!("{}", e);
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
                // This script is being loaded for the first time - initialize it
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
                // The script was already loaded - reload it
                println!("Reloading {}", path.display());

                // Remove any existing registered callbacks from the same script to prevent
                // duplicates
                let env = &script.environment;
                self.tasks.lock().unwrap().retain(|task| {
                    if let Some(task_env) = task.environment() {
                        task_env != *env
                    } else {
                        true
                    }
                });

                eval(&script.environment)?;
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
                if let Err(e) = self.load_entrypoint(&event.path) {
                    println!("{}", e);
                }
            }
        }

        Ok(())
    }
}
