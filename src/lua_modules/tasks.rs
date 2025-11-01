use eldenring::{
    cs::{CSTaskGroupIndex, CSTaskImp},
    fd4::FD4TaskData,
};
use eldenring_util::task::CSTaskImpExt;
use fromsoftware_shared::get_instance;
use mlua::{chunk, prelude::*};
use std::sync::{Arc, Mutex};

const TASK_END: i32 = 0;
const TASK_RESTART: i32 = 1;

struct Task {
    func: LuaFunction,
    thread: LuaThread,
}

/**
 * Lua API for registering recurring tasks
 */
pub(crate) struct Tasks {
    tasks: Arc<Mutex<Vec<Task>>>,
}

impl Tasks {
    pub fn new() -> Self {
        let result = Self {
            tasks: Arc::new(Mutex::new(Vec::new())),
        };

        let tasks = Arc::downgrade(&result.tasks);

        let cs_task = unsafe { get_instance::<CSTaskImp>() }.unwrap();
        cs_task.run_recurring(
            move |_: &FD4TaskData| {
                let Some(tasks) = tasks.upgrade() else { return };
                tasks
                    .lock()
                    .unwrap()
                    .retain(|task| match task.thread.resume(()) {
                        Ok(Some(TASK_END)) => {
                            println!("EndEvent");
                            false
                        }
                        Ok(Some(TASK_RESTART)) => {
                            println!("RestartEvent");
                            if let Err(e) = task.thread.reset(task.func.clone()) {
                                println!("{}", e);
                                false
                            } else {
                                true
                            }
                        }
                        Ok(None) => {
                            println!("continue");
                            true
                        }
                        Err(e) => {
                            println!("{}", e);
                            false
                        }
                        _ => true,
                    });
            },
            CSTaskGroupIndex::FrameBegin,
        );

        result
    }

    pub fn register(&self, lua: &Lua) -> LuaResult<()> {
        let initialize_task = lua.create_function({
            let tasks = Arc::downgrade(&self.tasks);
            move |lua, func: LuaFunction| {
                if let Some(tasks) = tasks.upgrade() {
                    tasks.lock().unwrap().push(Task {
                        func: func.clone(),
                        thread: lua.create_thread(func)?,
                    });
                }
                Ok(())
            }
        })?;

        let end_task = lua
            .load(chunk! {
                function()
                    coroutine.yield($TASK_END)
                end
            })
            .eval::<LuaFunction>()?;

        let restart_task = lua
            .load(chunk! {
                function()
                    coroutine.yield($TASK_RESTART)
                end
            })
            .eval::<LuaFunction>()?;

        let globals = lua.globals();
        globals.set("InitializeEvent", initialize_task)?;
        globals.set("EndEvent", end_task)?;
        globals.set("RestartEvent", restart_task)
    }

    /**
     * Remove tasks with callbacks that have the given environment. This is called before hot
     * reloading an entrypoint
     */
    pub fn drop_environment(&self, environment: &LuaTable) {
        self.tasks.lock().unwrap().retain(|task| {
            if let Some(task_env) = task.func.environment() {
                task_env != *environment
            } else {
                true
            }
        });
    }
}
