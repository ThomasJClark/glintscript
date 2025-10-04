use fromsoftware_shared::get_instance;

use crate::cs::{CSEmkEventIns, CSEmkSystem, EmkEventId, EmkInstruction};

const DELTA_TIME: f32 = 1f32 / 30f32;

#[repr(i8)]
#[allow(unused)]
#[derive(Debug)]
pub enum ConditionGroup {
    Or15 = -15,
    Or14 = -14,
    Or13 = -13,
    Or12 = -12,
    Or11 = -11,
    Or10 = -10,
    Or9 = -9,
    Or8 = -8,
    Or7 = -7,
    Or6 = -6,
    Or5 = -5,
    Or4 = -4,
    Or3 = -3,
    Or2 = -2,
    Or1 = -1,
    Main = 0,
    And1 = 1,
    And2 = 2,
    And3 = 3,
    And4 = 4,
    And5 = 5,
    And6 = 6,
    And7 = 7,
    And8 = 8,
    And9 = 9,
    And10 = 10,
    And11 = 11,
    And12 = 12,
    And13 = 13,
    And14 = 14,
    And15 = 15,
}

#[repr(i8)]
#[allow(unused)]
#[derive(Debug)]
pub enum ComparisonType {
    Equal = 0,
    NotEqual = 1,
    Greater = 2,
    Less = 3,
    GreaterOrEqual = 4,
    LessOrEqual = 5,
}

/**
 * Execute a single ad hoc EMEVD instruction in a temporary event, returning the condition result,
 * if any
 *
 * Safety: args must be the type expected by the instruction
 */
pub unsafe fn execute_emevd_instruction(
    instruction: EmkInstruction,
    args: *const u8,
) -> Option<bool> {
    let cs_emk_system = unsafe { get_instance::<CSEmkSystem>() }?;

    // Construct a new event for this instruction, which is immediately destroyed afterwards
    let mut event = CSEmkEventIns::new(EmkEventId::new(0, 0), None, None);
    event.next_instruction = &instruction;
    event.next_instruction_args = args;

    cs_emk_system.instruction_banks.execute(DELTA_TIME, &event);

    let condition = event.base.conditions.head.as_ref();
    condition.map(|condition| condition.result)
}

/**
 * Declares Lua bindings for EMEVD instructions that doesn't return anything
 */
#[macro_export]
macro_rules! lua_emevd_commands {
    (
        fn $register_name:ident(lua: &$luaType:ty, table: &$luaTableType:ty) -> $luaResultType:ident<()>;
        $(struct $struct_name:ident($bank:literal, $id:literal) {
            $($arg_name:ident: $arg_ty:ty),* $(,)?
        })*
    ) => {
        $(#[repr(C)]
        struct $struct_name {
            $($arg_name: $arg_ty,)*
        })*

        fn $register_name(lua: &$luaType, table: &$luaTableType) -> $luaResultType<()> {
            $(table.set(
                stringify!($struct_name),
                lua.create_function(
                    |_: &$luaType, ($($arg_name,)*): ( $(Option<$arg_ty>,)* )| -> $luaResultType<()> {
                        let instruction = $crate::cs::EmkInstruction::new($bank, $id);
                        let args = $struct_name {
                            $($arg_name: $arg_name.unwrap_or_default(),)*
                        };
                        unsafe {
                            let args: *const u8 = std::mem::transmute(&args);
                            $crate::emevd_utils::execute_emevd_instruction(
                                instruction,
                                args
                            );
                        }
                        Ok(())
                    }
                )?,
            )?;)*
            Ok(())
        }
    };
}

/**
 * Declares Lua bindings for EMEVD instructions that evaluate a condition. The first argument is
 * implicitly passsed the MAIN condition group, and the result of the condition is returned as
 * a boolean to the Lua caller.
 */
#[macro_export]
macro_rules! lua_emevd_conditions {
    (
        fn $register_name:ident(lua: &$luaType:ty, table: &$luaTableType:ty) -> $luaResultType:ident<()>;
        $(struct $struct_name:ident($bank:literal, $id:literal) {
            $($arg_name:ident: $arg_ty:ty),* $(,)?
        })*
    ) => {
        $(#[repr(C)]
        struct $struct_name {
            condition_group: $crate::emevd_utils::ConditionGroup,
            $($arg_name: $arg_ty,)*
        })*

        fn $register_name(lua: &$luaType, table: &$luaTableType) -> $luaResultType<()> {
            $(table.set(
                stringify!($struct_name),
                lua.create_function(
                    |_: &$luaType, ($($arg_name,)*): ( $(Option<$arg_ty>,)* )| -> $luaResultType<Option<bool>> {
                        let instruction = $crate::cs::EmkInstruction::new($bank, $id);
                        let args = $struct_name {
                            condition_group: $crate::emevd_utils::ConditionGroup::Main,
                            $($arg_name: $arg_name.unwrap_or_default(),)*
                        };
                        unsafe {
                            let args: *const u8 = std::mem::transmute(&args);
                            Ok($crate::emevd_utils::execute_emevd_instruction(
                                instruction,
                                args
                            ))
                        }
                    }
                )?,
            )?;)*
            Ok(())
        }
    };
}
