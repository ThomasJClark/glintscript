use anyhow::Result;
use mlua::prelude::*;
use std::{
    fs,
    path::{Path, PathBuf},
};

use crate::lua_modules;

pub struct Script {
    path: PathBuf,
    function: LuaFunction,
}

pub struct ScriptContext {
    lua: Lua,
    scripts: Vec<Script>,
}

impl ScriptContext {
    pub fn new() -> Result<Self> {
        let lua = Lua::new();

        let glint = lua.create_table()?;
        glint.set("memory", lua_modules::memory::create(&lua)?)?;
        lua.globals().set("glint", &glint)?;

        Ok(Self {
            lua,
            scripts: Vec::new(),
        })
    }

    pub fn load_script(&mut self, path: &Path) -> Result<()> {
        println!("Executing script {}", path.display());

        self.lua.globals().get::<LuaTable>("package")?.set(
            "path",
            format!("{}\\?.lua", path.parent().unwrap().display()),
        )?;

        let contents = fs::read_to_string(path)?;

        let environment = self.lua.create_table()?;
        let metatable = self.lua.create_table()?;
        metatable.set("__index", self.lua.globals())?;
        environment.set_metatable(Some(metatable))?;

        let function = self
            .lua
            .load(&contents)
            .set_name(format!("@{}", path.display()))
            .set_environment(environment.clone())
            .eval::<LuaFunction>()?;

        function.set_environment(environment)?;

        self.scripts.push(Script {
            path: path.to_path_buf(),
            function,
        });

        Ok(())
    }

    pub fn update(&mut self) {
        for script in &mut self.scripts {
            if let Err(e) = script.function.call::<()>(()) {
                println!("{}", e);
            }
        }
    }
}
