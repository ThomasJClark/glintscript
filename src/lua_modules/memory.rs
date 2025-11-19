use std::num::NonZeroUsize;

use microseh::try_seh;
use mlua::prelude::*;
use pelite::image::image_base;

use crate::lua_modules::glintscript_error::GlintScriptError;

fn memory_error(
    seh_exception: microseh::Exception,
    read: bool,
    base: usize,
    pointer_chain: Option<&[usize]>,
) -> GlintScriptError {
    GlintScriptError(if let Some(pointer_chain) = pointer_chain {
        format!(
            "Access violation trying to {} memory at {:#x} (base={:#x}, pointer_chain={:?}): {}",
            if read { "read" } else { "write" },
            seh_exception.address() as usize,
            base,
            pointer_chain
                .iter()
                .map(|offset| format!("{:#x}", offset))
                .collect::<Vec<_>>(),
            seh_exception.code(),
        )
    } else {
        format!(
            "Access violation trying to {} memory at {:#x}: {}",
            if read { "read" } else { "write" },
            seh_exception.address() as usize,
            base,
        )
    })
}

// Follow a chain of pointer offsets from the given base, returning the value at the end of the
// chain or `None` if any pointer in the chain is null.
//
// # Safety
//
// The chain of pointers must be either valid to access in this context, or null.
//
// This guarantee is mostly the responsibility of Lua code external to this crate. As an extra
// safety measure to prevent most crashes due to defective Lua code, hardware exceptions raised in
// this function are caught and converted into Lua errors. As a result, nothing in this function
// can be assumed to be dropped.
unsafe fn get_pointer_chain(base: usize, pointer_chain: Option<&[usize]>) -> Option<NonZeroUsize> {
    let mut pointer = NonZeroUsize::new(base)?;

    for offset in pointer_chain.unwrap_or(&[]) {
        let next_base = pointer.get() as *const usize;
        pointer = NonZeroUsize::new(unsafe { *next_base })?.checked_add(*offset)?;
    }

    Some(pointer)
}

fn get<T>(_: &Lua, (base, pointer_chain): (usize, Option<Vec<usize>>)) -> LuaResult<Option<T>>
where
    T: Copy,
{
    let pointer_chain = pointer_chain.as_deref();

    try_seh(|| unsafe {
        get_pointer_chain(base, pointer_chain).map(|pointer| *(pointer.get() as *const T))
    })
    .map_err(|e| LuaError::external(memory_error(e, true, base, pointer_chain)))
}

fn set<T>(_: &Lua, (base, pointer_chain, value): (usize, Option<Vec<usize>>, T)) -> LuaResult<bool>
where
    T: Copy,
{
    let pointer_chain = pointer_chain.as_deref();

    try_seh(|| unsafe {
        get_pointer_chain(base, pointer_chain)
            .inspect(|pointer| {
                *(pointer.get() as *mut T) = value;
            })
            .is_some()
    })
    .map_err(|e| LuaError::external(memory_error(e, false, base, pointer_chain)))
}

/**
 * The `Memory` module, used for low-level access to the game's memory
 */
pub(crate) fn register(lua: &Lua) -> LuaResult<()> {
    let memory = lua.create_table()?;

    memory.set("Base", image_base() as *const _ as usize)?;

    let singletons = lua.create_table()?;
    for (name, addr) in from_singleton::map() {
        singletons.set(name.as_str(), addr.as_ptr() as usize)?;
    }

    memory.set("Singletons", singletons)?;

    memory.set("GetU8", lua.create_function(get::<u8>)?)?;
    memory.set("GetU16", lua.create_function(get::<u16>)?)?;
    memory.set("GetU32", lua.create_function(get::<u32>)?)?;
    memory.set("GetU64", lua.create_function(get::<u64>)?)?;
    memory.set("GetI8", lua.create_function(get::<i8>)?)?;
    memory.set("GetI16", lua.create_function(get::<i16>)?)?;
    memory.set("GetI32", lua.create_function(get::<i32>)?)?;
    memory.set("GetI64", lua.create_function(get::<i64>)?)?;
    memory.set("GetF32", lua.create_function(get::<f32>)?)?;
    memory.set("GetF64", lua.create_function(get::<f64>)?)?;
    memory.set("GetPointer", lua.create_function(get::<usize>)?)?;

    memory.set("SetU8", lua.create_function(set::<u8>)?)?;
    memory.set("SetU16", lua.create_function(set::<u16>)?)?;
    memory.set("SetU32", lua.create_function(set::<u32>)?)?;
    memory.set("SetU64", lua.create_function(set::<u64>)?)?;
    memory.set("SetI8", lua.create_function(set::<i8>)?)?;
    memory.set("SetI16", lua.create_function(set::<i16>)?)?;
    memory.set("SetI32", lua.create_function(set::<i32>)?)?;
    memory.set("SetI64", lua.create_function(set::<i64>)?)?;
    memory.set("SetF32", lua.create_function(set::<f32>)?)?;
    memory.set("SetF64", lua.create_function(set::<f64>)?)?;
    memory.set("SetPointer", lua.create_function(set::<usize>)?)?;

    lua.globals().set("Memory", memory)
}
