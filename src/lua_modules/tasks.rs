use eldenring::{
    cs::{CSTaskGroupIndex, CSTaskImp},
    fd4::FD4TaskData,
};
use fromsoftware_shared::{FromStatic, SharedTaskImpExt};
use mlua::{AppDataRefMut, chunk, prelude::*};

use crate::lua_modules::glintscript_error::GlintScriptError;

const END_EVENT: i64 = 0;
const RESTART_EVENT: i64 = 1;

#[derive(Default)]
struct TaskData {
    /**
     * Lua threads that can be paused and restarted. The name "event" is because these are used to
     * implement a coroutine interface similar to DarkScript
     */
    events: Vec<(LuaFunction, LuaThread)>,

    /**
     * Synchronous Lua callbacks that are run on each tick
     */
    tasks: Vec<LuaFunction>,
}

impl TaskData {
    fn from_lua(lua: &Lua) -> LuaResult<AppDataRefMut<'_, Self>> {
        lua.try_app_data_mut()
            .map(|data| data.unwrap())
            .map_err(|_| {
                LuaError::external(GlintScriptError(
                    "Can't register a task inside another task".to_string(),
                ))
            })
    }
}

/**
 * Resume all events, and either remove them, restart them, or do nothing depending on what was
 * yielded from the Lua function
 */
fn tick(lua: &Lua) {
    let mut data = lua.app_data_mut::<TaskData>().unwrap();

    data.events.retain(|(func, thread)| {
        match thread.resume::<LuaValue>(()) {
            Err(e) => {
                println!("{}", e);
                false
            }

            // EndEvent() was called - don't retain the thread
            Ok(LuaValue::Integer(END_EVENT)) => false,

            // RestartEvent() was called - reset the state of the thread
            Ok(LuaValue::Integer(RESTART_EVENT)) => thread
                .reset(func.clone())
                .inspect_err(|e| println!("{}", e))
                .is_ok(),

            // If the coroutine otherwise yielded, we're either waiting for
            // something (resumable) or the function returned (not resumable)
            _ => thread.status() == LuaThreadStatus::Resumable,
        }
    });

    // Only cancel tasks if they raise errors
    data.tasks.retain(|func| {
        func.call::<LuaValue>(())
            .inspect_err(|e| println!("{}", e))
            .is_ok()
    });
}

/**
 * Remove events with callbacks that have the given environment. This is called before hot
 * reloading an entrypoint
 */
pub fn drop_environment(lua: &Lua, environment: &LuaTable) {
    let mut data = lua.app_data_mut::<TaskData>().unwrap();

    data.events.retain(|(func, _)| {
        if let Some(event_environment) = func.environment() {
            event_environment != *environment
        } else {
            true
        }
    });

    data.tasks.retain(|func| {
        if let Some(task_environment) = func.environment() {
            task_environment != *environment
        } else {
            true
        }
    });
}

/**
 * Lua API for registering recurring tasks
 */
pub fn register(lua: &Lua) -> LuaResult<()> {
    lua.set_app_data(TaskData::default());

    let register_task = lua.create_function(|lua, func: LuaFunction| {
        TaskData::from_lua(lua)?.tasks.push(func);
        Ok(())
    })?;

    let initialize_event = lua.create_function(|lua, func: LuaFunction| {
        TaskData::from_lua(lua)?
            .events
            .push((func.clone(), lua.create_thread(func)?));
        Ok(())
    })?;

    let end_event: LuaFunction = lua
        .load(chunk! {
            function()
                coroutine.yield($END_EVENT)
            end
        })
        .eval()?;

    let restart_event: LuaFunction = lua
        .load(chunk! {
            function()
                coroutine.yield($RESTART_EVENT)
            end
        })
        .eval()?;

    let wait_for: LuaFunction = lua
        .load(chunk! {
            function(func)
                while not func() do
                    coroutine.yield()
                end
            end
        })
        .eval()?;

    let globals = lua.globals();
    globals.set("RegisterTask", register_task)?;
    globals.set("InitializeEvent", initialize_event)?;
    globals.set("EndEvent", end_event)?;
    globals.set("RestartEvent", restart_event)?;
    globals.set("WaitFor", wait_for)?;

    let cs_task = unsafe { CSTaskImp::instance() }.unwrap();
    cs_task.run_recurring(
        {
            let weak_lua = lua.weak();
            move |_: &FD4TaskData| {
                if let Some(lua) = weak_lua.try_upgrade() {
                    tick(&lua);
                }
            }
        },
        CSTaskGroupIndex::FrameBegin,
    );

    Ok(())
}
