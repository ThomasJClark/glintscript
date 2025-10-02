mod lua_modules;
mod me3_profile;
mod script_context;

use anyhow::{Context, Result};
use eldenring::{
    cs::{CSTaskGroupIndex, CSTaskImp},
    fd4::FD4TaskData,
};
use eldenring_util::{system::wait_for_system_init, task::CSTaskImpExt};
use fromsoftware_shared::{Program, get_instance};
use std::time::Duration;
use windows::Win32::{Foundation::HANDLE, System::SystemServices::DLL_PROCESS_ATTACH};

use crate::script_context::ScriptContext;

fn start() -> Result<()> {
    let script_context = Box::leak(Box::new(ScriptContext::new()?));

    let script_dirs = me3_profile::get_script_dirs()
        .context("Couldn't find any script folders in me3 packages")?;

    for dir in script_dirs {
        script_context.add_dir(&dir)?;
    }

    let cs_task = unsafe { get_instance::<CSTaskImp>() }.unwrap();
    cs_task.run_recurring(
        move |_: &FD4TaskData| script_context.update(),
        CSTaskGroupIndex::FrameBegin,
    );

    Ok(())
}

#[unsafe(no_mangle)]
pub extern "C" fn DllMain(_: HANDLE, reason: u32) -> bool {
    if reason == DLL_PROCESS_ATTACH {
        std::thread::spawn(move || {
            wait_for_system_init(&Program::current(), Duration::MAX)
                .expect("Timeout waiting for system init");
            start().unwrap();
        });
    }

    return true;
}
