import gleeunit
import gleeunit/should
import zed_pkg_test_gleam_lib

pub fn main() {
  gleeunit.main()
}

pub fn greet_identifies_the_immutable_zed_package_namespace_test() {
  zed_pkg_test_gleam_lib.greet("consumer")
  |> should.equal("hello consumer from zed-pkg-test/gleam-lib")
}

pub fn language_tag_matches_paths_json_test() {
  zed_pkg_test_gleam_lib.language
  |> should.equal("gleam")
}
