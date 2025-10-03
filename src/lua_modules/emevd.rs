/**
 * The `glint.emevd` module. Allows calling EMEVD operations from Lua.
 */
use crate::cs::{CSEmkEventIns, CSEmkSystem, EmkClasses, EmkEventId, EmkInstruction};
use anyhow::Result;
use eldenring::cs::BlockId;
use fromsoftware_shared::{Program, get_instance};
use mlua::prelude::*;
use pelite::pe64::PeObject;
use std::mem;

pub(crate) fn create(lua: &Lua) -> Result<LuaFunction> {
    Ok(
        lua.create_function(|_, (bank, id, args): (u32, u32, Vec<i32>)| {
            let Some(cs_emk_system) = (unsafe { get_instance::<CSEmkSystem>() }) else {
                return Ok(false);
            };

            let instruction = EmkInstruction::new(bank, id);

            let mut event_ins = CSEmkEventIns::new(&EmkEventId::new(0, 0), None, BlockId::none());
            event_ins.instruction = &instruction;
            event_ins.args = args.as_ptr();

            let emevd_group_switch: extern "C" fn(&EmkClasses, f32, &CSEmkEventIns) =
                unsafe { mem::transmute(Program::current().image_base() + 0x567e00) };

            emevd_group_switch(
                &cs_emk_system.instruction_classes,
                0.033333333f32,
                &event_ins,
            );

            Ok(true)
        })?,
    )
}
