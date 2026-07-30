/// The one thing this zed-sourced package exports.
///
/// Gleam is deliberately the fixture for the *no native adapter* path: zed
/// installs it into zed_modules/ and describes it only in .zed/paths.json,
/// because there is no GLEAMPATH-style override for zed to write.
pub fn greet(who: String) -> String {
  "hello " <> who <> " from zed-pkg-test/gleam-lib"
}

/// The language tag a consumer cross-checks against .zed/paths.json.
pub const language: String = "gleam"
