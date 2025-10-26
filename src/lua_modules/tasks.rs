use eldenring::{
    cs::{CSTaskGroupIndex, CSTaskImp},
    fd4::FD4TaskData,
};
use eldenring_util::task::CSTaskImpExt;
use fromsoftware_shared::get_instance;
use mlua::prelude::*;
use std::sync::{Arc, Mutex};

/**
 * Lua API for registering recurring tasks
 */
pub(crate) struct Tasks {
    tasks: Arc<Mutex<Vec<LuaFunction>>>,
}

impl Tasks {
    pub fn new() -> Self {
        let result = Self {
            tasks: Arc::new(Mutex::new(Vec::new())),
        };

        let cs_task = unsafe { get_instance::<CSTaskImp>() }.unwrap();
        cs_task.run_recurring(
            {
                let tasks = Arc::downgrade(&result.tasks);
                move |data: &FD4TaskData| {
                    if let Some(tasks) = tasks.upgrade() {
                        for task in tasks.lock().unwrap().iter() {
                            if let Err(e) = task.call::<()>(data.delta_time.time) {
                                println!("{}", e);
                            }
                        }
                    }
                }
            },
            CSTaskGroupIndex::FrameBegin,
        );

        result
    }

    pub fn register(&self, lua: &Lua) -> LuaResult<()> {
        lua.globals().set(
            "InitializeTask",
            lua.create_function({
                let tasks = Arc::downgrade(&self.tasks);
                move |_, func: LuaFunction| {
                    if let Some(tasks) = tasks.upgrade() {
                        tasks.lock().unwrap().push(func);
                    }

                    Ok(())
                }
            })?,
        )
    }

    /**
     * Remove tasks with callbacks that have the given environment. This is called before hot
     * reloading an entrypoint
     */
    pub fn drop_environment(&self, environment: &LuaTable) {
        self.tasks.lock().unwrap().retain(|task| {
            if let Some(task_env) = task.environment() {
                task_env != *environment
            } else {
                true
            }
        });
    }
}
