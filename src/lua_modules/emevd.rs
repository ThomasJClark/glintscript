/**
 * The `glint.emevd` module. Allows calling EMEVD operations from Lua.
 */
use crate::{lua_emevd_commands, lua_emevd_conditions};
use anyhow::Result;
use mlua::prelude::*;

lua_emevd_commands! {
    fn register_emevd_commands(lua: &Lua, table: &LuaTable) -> LuaResult<()>;

    struct DisplayGenericDialog(2007, 1) {
        message_id: i32,
        dialog_type: i16,
        number_of_options: i16,
        entity_id: u32,
        display_distance: f32,
    }
    struct DisplayBanner(2007, 2) {
        banner_type: i8,
    }
    struct DisplayStatusMessage(2007, 3) {
        message_id: i32,
        pad_state: bool,
    }
    struct DisplayBlinkingMessage(2007, 4) {
        message_id: i32,
    }
    struct DisplayFullScreenMessage(2007, 9) {
        message_id: i32,
    }
    struct DisplayGenericDialogAndSetEventFlags(2007, 10) {
        message_id: i32,
        dialog_type: i16,
        number_of_options: i16,
        entity_id: u32,
        display_distance: f32,
        left_response_event_flag_id: u32,
        right_response_event_flag_id: u32,
        cancel_response_event_flag_id: u32,
    }
    struct DisplayBlinkingMessageWithPriority(2007, 12) {
        message_id: i32,
        priority: i16,
        should_interrupt: bool,
    }
    struct DisplaySubareaWelcomeMessage(2007, 13) {
        message_id: i32,
    }
    struct DisplayAreaWelcomeMessage(2007, 14) {
        message_id: i32,
    }
    struct ShowTutorialPopup(2007, 15) {
        tutorial_param_id: i32,
        unknown1: bool,
        unknown2: bool,
    }
    struct DisplayNetworkMessage(2007, 16) {
        network_message_id: i32,
        unknown: bool,
    }
}

lua_emevd_conditions! {
    fn register_emevd_conditions(lua: &Lua, table: &LuaTable) -> LuaResult<()>;

    struct EventFlag(3, 0) {
        desired_flag_state: i8,
        target_event_flag_type: u8,
        target_event_flag_id: u32,
    }

    struct PlayersSoulLevel(4, 13) {
        comparison_type: u8,
        target_soul_level: u32,
    }
}

pub(crate) fn create(lua: &Lua) -> Result<LuaTable> {
    let emevd = lua.create_table()?;
    register_emevd_commands(lua, &emevd)?;
    register_emevd_conditions(lua, &emevd)?;
    Ok(emevd)
}
