# gleam-lib (zed-pkg-test/gleam-lib)

A trivial Gleam package published to the zed registry, consumed **via zed**
while Hex keeps owning the rest of `gleam.toml`.

Gleam is the fixture for the **no-adapter** path, which is the majority case.
zed federates many ecosystems but ships native wiring for only six —
`node`, `java`, `go`, `python`, `rust`, `dart`. Everything else uses
`adapter = "none"`: the package lands in the install directory and the only
machine-readable description of it is `.zed/paths.json`.

```json
{
  "modules_dir": "zed_modules",
  "packages": [
    {
      "ecosystem": "universal",
      "language": "universal",
      "package": "zed-pkg-test/gleam-lib",
      "path": "zed_modules/zed-pkg-test/gleam-lib",
      "version": "1.0.0"
    }
  ]
}
```

Verified end to end against `zed 0.1.0`, `gleam 1.17.0` and OTP 29: publish,
install, and `gleam run` in [`gleam-app`](https://github.com/zed-pkg-test/gleam-app)
resolving the installed package through an ordinary `gleam.toml` path
dependency. No `GLEAMPATH`-style override exists, so that path entry is written
by hand — the same manual step Dart needs, for the same reason.

## Two things worth knowing

- **Hex is not a native publish target.** zed's native-registry preflight covers
  npm, crates-io, pub.dev and PyPI only. A `[targets.*.native]` route with
  `registry = "hex"` has nothing behind it, so this package is zed-only and its
  Hex dependencies (`gleam_stdlib`, `gleeunit`) are resolved by Gleam itself.
- **`language`/`ecosystem` read `universal`.** Single-language packages carry no
  language tag; only *polyglot targets whose name matches a known language
  token* get a real one (see `polyglot-lib`, where the `nodejs` target installs
  as `language: "nodejs"`, `ecosystem: "npm"`). Tooling reading `paths.json`
  cannot currently tell that this package is Gleam.

## License

MIT
