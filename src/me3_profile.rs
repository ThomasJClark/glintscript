use anyhow::Result;
use me3_mod_protocol::{ModProfile, package::AssetOverrideSource};
use std::{env, fs, path::PathBuf};

/**
 * Find script\glint\ directories contained within ME3 mod packages
 */
pub(crate) fn get_script_dirs() -> Result<Vec<PathBuf>> {
    // Read the config file supplied by the ME3 launcher
    let host_config_path: PathBuf =
        serde_json::from_str(&env::var("ME3_LAUNCHER_HOST_CONFIG_PATH")?)?;

    // Parse the config file assuming the V1 profile format
    let file_contents = fs::read_to_string(&host_config_path)?;
    let me3_mod_profile = ModProfile::V1(toml::from_str(&file_contents)?);

    Ok(me3_mod_profile
        .packages()
        .iter()
        .map(|package| package.asset_path().join("script").join("glint"))
        .filter(|dir_path| dir_path.is_dir())
        .collect::<Vec<PathBuf>>())
}
