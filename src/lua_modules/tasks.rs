use eldenring::{
    cs::{CSTaskGroupIndex, CSTaskImp},
    fd4::FD4TaskData,
};
use eldenring_util::task::CSTaskImpExt;
use fromsoftware_shared::get_instance;
use mlua::{chunk, prelude::*};
use std::sync::{Arc, Mutex};

const END_EVENT: i64 = 0;
const RESTART_EVENT: i64 = 1;

struct Event {
    func: LuaFunction,
    thread: LuaThread,
}

/**
 * Lua API for registering recurring tasks
 */
pub(crate) struct Tasks {
    events: Arc<Mutex<Vec<Event>>>,
}

impl Tasks {
    pub fn new() -> Self {
        let result = Self {
            events: Arc::new(Mutex::new(Vec::new())),
        };

        let events = Arc::downgrade(&result.events);

        let cs_task = unsafe { get_instance::<CSTaskImp>() }.unwrap();
        cs_task.run_recurring(
            move |_: &FD4TaskData| {
                if let Some(events) = events.upgrade() {
                    // Resume all events, then either remove them, restart them, or do nothing
                    // depending on what was yielded from the Lua function
                    events.lock().unwrap().retain(|event| {
                        let thread = &event.thread;
                        match thread.resume::<LuaValue>(()) {
                            Err(e) => {
                                println!("{}", e);
                                false
                            }

                            // EndEvent() was called - don't retain the thread
                            Ok(LuaValue::Integer(END_EVENT)) => false,

                            // RestartEvent() was called - reset the state of the thread
                            Ok(LuaValue::Integer(RESTART_EVENT)) => thread
                                .reset(event.func.clone())
                                .inspect_err(|e| println!("{}", e))
                                .is_ok(),

                            // If the coroutine otherwise yielded, we're either waiting for
                            // something (resumable) or the function returned (not resumable)
                            _ => thread.status() == LuaThreadStatus::Resumable,
                        }
                    });
                }
            },
            CSTaskGroupIndex::FrameBegin,
        );

        result
    }

    pub fn register(&self, lua: &Lua) -> LuaResult<()> {
        let initialize_event = lua.create_function({
            let events = Arc::downgrade(&self.events);
            move |lua, func: LuaFunction| {
                if let Some(events) = events.upgrade() {
                    events.lock().unwrap().push(Event {
                        func: func.clone(),
                        thread: lua.create_thread(func)?,
                    });
                }
                Ok(())
            }
        })?;

        let end_event = lua
            .load(chunk! {
                function()
                    coroutine.yield($END_EVENT)
                end
            })
            .eval::<LuaFunction>()?;

        let restart_event = lua
            .load(chunk! {
                function()
                    coroutine.yield($RESTART_EVENT)
                end
            })
            .eval::<LuaFunction>()?;

        let wait_for = lua
            .load(chunk! {
                function(func)
                    while not func() do
                        coroutine.yield()
                    end
                end
            })
            .eval::<LuaFunction>()?;

        let globals = lua.globals();
        globals.set("InitializeEvent", initialize_event)?;
        globals.set("EndEvent", end_event)?;
        globals.set("RestartEvent", restart_event)?;
        globals.set("WaitFor", wait_for)
    }

    /**
     * Remove events with callbacks that have the given environment. This is called before hot
     * reloading an entrypoint
     */
    pub fn drop_environment(&self, environment: &LuaTable) {
        self.events.lock().unwrap().retain(|event| {
            if let Some(event_environment) = event.func.environment() {
                event_environment != *environment
            } else {
                true
            }
        });
    }
}
