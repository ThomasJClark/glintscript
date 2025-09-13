/**
 * The `glint.memory` module, used for low-level access to the game's memory
 */
use anyhow::Result;
use eldenring_util::{program::Program, singleton::build_singleton_table};
use microseh::try_seh;
use mlua::prelude::*;
use pelite::pe64::PeObject;

/**
 * Follow a chain of pointer offsets from the given base, returning the value at the end of the
 * chain or `None` if any pointer in the chain is null.
 */
unsafe fn get_pointer_chain<T>(base: usize, pointer_chain: Option<&[usize]>) -> Option<*mut T> {
    let mut pointer = base;

    for offset in pointer_chain.unwrap_or(&[]) {
        if pointer == 0 {
            return None;
        }

        pointer = unsafe { *(pointer as *mut usize) } + offset;
    }

    if pointer == 0 {
        return None;
    }

    Some(pointer as *mut T)
}

fn lua_getter_function<T>(
    _: &Lua,
    (base, pointer_chain): (usize, Option<Vec<usize>>),
) -> LuaResult<Option<T>>
where
    T: Copy,
{
    let value = try_seh(|| unsafe {
        get_pointer_chain::<T>(base, pointer_chain.as_ref().map(|c| c.as_slice())).map(|addr| *addr)
    });

    Ok(value.unwrap_or(None))
}

fn lua_setter_function<T>(
    _: &Lua,
    (base, pointer_chain, value): (usize, Option<Vec<usize>>, T),
) -> LuaResult<bool>
where
    T: Copy,
{
    let success = try_seh(|| unsafe {
        if let Some(dest) =
            get_pointer_chain::<T>(base, pointer_chain.as_ref().map(|c| c.as_slice()))
        {
            *dest = value;
            return true;
        }
        return false;
    });

    Ok(success.unwrap_or(false))
}

pub(crate) fn create(lua: &Lua) -> Result<mlua::Table> {
    let program = &Program::current();

    let memory = lua.create_table()?;

    memory.set("base", program.image_base())?;

    memory.set("singletons", build_singleton_table(program)?)?;

    memory.set("get_u8", lua.create_function(lua_getter_function::<u8>)?)?;
    memory.set("get_u16", lua.create_function(lua_getter_function::<u16>)?)?;
    memory.set("get_u32", lua.create_function(lua_getter_function::<u32>)?)?;
    memory.set("get_u64", lua.create_function(lua_getter_function::<u64>)?)?;
    memory.set("get_i8", lua.create_function(lua_getter_function::<i8>)?)?;
    memory.set("get_i16", lua.create_function(lua_getter_function::<i16>)?)?;
    memory.set("get_i32", lua.create_function(lua_getter_function::<i32>)?)?;
    memory.set("get_i64", lua.create_function(lua_getter_function::<i64>)?)?;
    memory.set("get_f32", lua.create_function(lua_getter_function::<f32>)?)?;
    memory.set("get_f64", lua.create_function(lua_getter_function::<f64>)?)?;
    memory.set(
        "get_pointer",
        lua.create_function(lua_getter_function::<usize>)?,
    )?;

    memory.set("set_u8", lua.create_function(lua_setter_function::<u8>)?)?;
    memory.set("set_u16", lua.create_function(lua_setter_function::<u16>)?)?;
    memory.set("set_u32", lua.create_function(lua_setter_function::<u32>)?)?;
    memory.set("set_u64", lua.create_function(lua_setter_function::<u64>)?)?;
    memory.set("set_i8", lua.create_function(lua_setter_function::<i8>)?)?;
    memory.set("set_i16", lua.create_function(lua_setter_function::<i16>)?)?;
    memory.set("set_i32", lua.create_function(lua_setter_function::<i32>)?)?;
    memory.set("set_i64", lua.create_function(lua_setter_function::<i64>)?)?;
    memory.set("set_f32", lua.create_function(lua_setter_function::<f32>)?)?;
    memory.set("set_f64", lua.create_function(lua_setter_function::<f64>)?)?;
    memory.set(
        "set_pointer",
        lua.create_function(lua_setter_function::<usize>)?,
    )?;

    Ok(memory)
}
