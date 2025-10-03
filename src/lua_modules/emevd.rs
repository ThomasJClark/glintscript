/**
 * The `glint.emevd` module. Allows calling EMEVD operations from Lua.
 */
use crate::cs::{CSEmkEventIns, CSEmkSystem, EmkEventId, EmkInstruction};
use anyhow::Result;
use fromsoftware_shared::get_instance;
use mlua::prelude::*;
use std::mem;

const DELTA_TIME: f32 = 1f32 / 30f32;

/**
 * Ad hoc execute one single EMEVD instruction, returning the condition result if it has one
 */
fn execute(bank: u32, id: u32, args: Vec<i32>) -> Option<bool> {
    unsafe { get_instance::<CSEmkSystem>() }.and_then(|cs_emk_system| {
        let instruction = EmkInstruction::new(bank, id);

        // Construct a new event for this instruction, which is immediately destroyed afterwards
        let mut event = CSEmkEventIns::new(EmkEventId::new(0, 0), None, None);
        event.next_instruction = &instruction;
        event.next_instruction_args = unsafe { mem::transmute(args.as_ptr()) };

        cs_emk_system.instruction_banks.execute(DELTA_TIME, &event);

        // If the instruction has a result, executing the event adds it as the only element in
        // the conditions linked list
        let condition = event.base.conditions.head.as_ref();
        condition.map(|condition| condition.result)
    })
}

pub(crate) fn create(lua: &Lua) -> Result<LuaFunction> {
    Ok(lua
        .create_function(|_, (bank, id, args): (u32, u32, Vec<i32>)| Ok(execute(bank, id, args)))?)
}
