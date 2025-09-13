use anyhow::Result;
use me3_mod_protocol::{ModProfile, package::AssetOverrideSource};
use std::{env, fs, path::PathBuf};

/**
 * Find entrypoints in mod packages loaded by me3. Any file ending in `.glint.lua` in the
 * `script\glint` directory of a mod package will be loaded as a Glintscript entrypoint.
 */
pub(crate) fn get_scripts_from_packages() -> Result<Vec<PathBuf>> {
    // Read the config file supplied by the ME3 launcher
    let host_config_path =
        serde_json::from_str::<PathBuf>(&env::var("ME3_LAUNCHER_HOST_CONFIG_PATH")?)?;

    // Parse the config file assuming the V1 profile format
    let file_contents = fs::read_to_string(&host_config_path)?;
    let me3_mod_profile = ModProfile::V1(toml::from_str(&file_contents)?);

    // Search for script\glint subdirectories in each mod package, and return every file with
    // a .glint.lua extension.
    let script_dirs = me3_mod_profile
        .packages()
        .into_iter()
        .map(|package| (&package).asset_path().join("script").join("glint"))
        .filter(|dir_path| dir_path.is_dir());

    let scripts = script_dirs
        .flat_map(|dir_path| {
            fs::read_dir(dir_path)
                .into_iter()
                .flatten()
                .filter_map(|entry| entry.ok())
                .map(|entry| entry.path())
        })
        .filter(|script_path| script_path.to_str().unwrap().ends_with(".glint.lua"))
        .collect::<Vec<PathBuf>>();

    Ok(scripts)
}
