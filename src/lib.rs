mod cs;
mod emevd_utils;
mod lua_modules;
mod me3_profile;
mod script_context;

use anyhow::{Context, Result};
use eldenring_util::system::wait_for_system_init;
use fromsoftware_shared::Program;
use std::{
    sync::{Arc, LazyLock, Mutex},
    time::Duration,
};
use windows::Win32::{Foundation::HANDLE, System::SystemServices::DLL_PROCESS_ATTACH};

use crate::script_context::ScriptContext;

static SCRIPT_CONTEXT: LazyLock<Arc<Mutex<ScriptContext>>> = LazyLock::new(|| ScriptContext::new());

fn start() -> Result<()> {
    let mut script_context = SCRIPT_CONTEXT.lock().unwrap();

    script_context.register_apis()?;

    let script_dirs = me3_profile::get_script_dirs()
        .context("Couldn't find any script folders in me3 packages")?;

    for dir in script_dirs {
        script_context.add_dir(&dir)?;
    }

    Ok(())
}

#[unsafe(no_mangle)]
pub extern "C" fn DllMain(_: HANDLE, reason: u32) -> bool {
    if reason == DLL_PROCESS_ATTACH {
        std::thread::spawn(move || {
            wait_for_system_init(&Program::current(), Duration::MAX)
                .expect("Timeout waiting for system init");
            if let Err(e) = start() {
                println!("{}", e);
            }
        });
    }

    return true;
}
