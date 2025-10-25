/**
 * The `glint.memory` module, used for low-level access to the game's memory
 */
use fromsoftware_shared::Program;
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

pub(crate) fn create(lua: &Lua) -> LuaResult<mlua::Table> {
    let memory = lua.create_table()?;

    memory.set("Base", Program::current().image_base())?;

    let singletons = lua.create_table()?;
    for (name, addr) in from_singleton::map() {
        singletons.set(name.as_str(), addr.as_ptr() as usize)?;
    }

    memory.set("Singletons", singletons)?;

    memory.set("GetU8", lua.create_function(lua_getter_function::<u8>)?)?;
    memory.set("GetU16", lua.create_function(lua_getter_function::<u16>)?)?;
    memory.set("GetU32", lua.create_function(lua_getter_function::<u32>)?)?;
    memory.set("GetU64", lua.create_function(lua_getter_function::<u64>)?)?;
    memory.set("GetI8", lua.create_function(lua_getter_function::<i8>)?)?;
    memory.set("GetI16", lua.create_function(lua_getter_function::<i16>)?)?;
    memory.set("GetI32", lua.create_function(lua_getter_function::<i32>)?)?;
    memory.set("GetI64", lua.create_function(lua_getter_function::<i64>)?)?;
    memory.set("GetF32", lua.create_function(lua_getter_function::<f32>)?)?;
    memory.set("GetF64", lua.create_function(lua_getter_function::<f64>)?)?;
    memory.set(
        "GetPointer",
        lua.create_function(lua_getter_function::<usize>)?,
    )?;

    memory.set("SetU8", lua.create_function(lua_setter_function::<u8>)?)?;
    memory.set("SetU16", lua.create_function(lua_setter_function::<u16>)?)?;
    memory.set("SetU32", lua.create_function(lua_setter_function::<u32>)?)?;
    memory.set("SetU64", lua.create_function(lua_setter_function::<u64>)?)?;
    memory.set("SetI8", lua.create_function(lua_setter_function::<i8>)?)?;
    memory.set("SetI16", lua.create_function(lua_setter_function::<i16>)?)?;
    memory.set("SetI32", lua.create_function(lua_setter_function::<i32>)?)?;
    memory.set("SetI64", lua.create_function(lua_setter_function::<i64>)?)?;
    memory.set("SetF32", lua.create_function(lua_setter_function::<f32>)?)?;
    memory.set("SetF64", lua.create_function(lua_setter_function::<f64>)?)?;
    memory.set(
        "SetPointer",
        lua.create_function(lua_setter_function::<usize>)?,
    )?;

    Ok(memory)
}
