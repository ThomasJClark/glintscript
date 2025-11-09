use core::fmt;
use std::error;

#[derive(Debug, Clone)]
pub struct GlintScriptError(pub String);

impl error::Error for GlintScriptError {}

impl fmt::Display for GlintScriptError {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        self.0.fmt(f)
    }
}
