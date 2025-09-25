# Zig RGFW

Idiomatic Zig Bindings for RGFW

## Getting Started

### Prerequisites

This package requires RGFW. The RGFW source code as well as prebuilt libraries can be found on
[GitHub](https://github.com/ColleagueRiley/RGFW).

This package is built on Zig nightly, and will likely only support Zig nightly until the Zig
Software Foundation releases a stable 1.0.0 release. With this limitation in mind, the only
prerequisite to use this package is the latest version of Zig nightly. To install the nightly
build of Zig, download the `master` release from
[The Official Zig Website](https://ziglang.org/download/), or use your preferred package manager
/ editor extension (we prefer VSCode here).

### Installation

To install zig-rgfw, open a terminal in your Zig project and enter the following
command:

```bash
zig fetch --save git+https://github.com/manateeengine/zig-rgfw.git
```

Once you've ran the above command, add the following to your project's `build.zig`:

```zig
// Import the dependency
const rgfw = b.dependency("zig-rgfw", .{
    .target = target,
    .optimize = optimize,
});

// Add the dependency's module as an import named "rgfw" (assuming exe is the name
// of your build)
exe.root_module.addImport("rgfw", rgfw.module("rgfw"));
```

## Usage

```zig
// TODO: Build the package and write usage docs
```

Full usage documentation is coming very soon, as we're currently cooking up a project that augments
Zig doc comments and creates beautiful TypeDoc style websites!

## Running Examples

Examples can be found in the `./examples` folder. Each example has its own `zig build` command that
directly correlates with the name of the directory. For instance, if you'd like to run the example
in `./examples/basic`, you would run the following command:

```bash
zig build example-basic
```

## Compatibility Matrix

This project is not only hand-built, but a major work-in-progress, and won't cover everything that
RGFW has to offer, at least not in its initial release. This table provides an overview of how
compatible this project is with RGFW. See something missing that you really need? Feel free to open
a PR and add it!

**Key:**

- 🟢 Fully Implemented
- 🟡 Partially Implemented
- 🔴 Not Currently Implemented
- 🚫 Will Never be Implemented

| Method | Status | Project Equivalent | Notes |
| ------ | ------ | ------------------ | ----- |
| TODO   | TODO   | TODO               | TODO  |

## Roadmap

See the [Open Issues](https://github.com/manateeengine/zig-rgfw/issues) for a list of proposed
features (and known issues).

- [Top Feature Requests](https://github.com/manateeengine/zig-rgfw/issues?q=label%3Aenhancement%20is%3Aopen%20sort%3Areactions-desc)
- [Top Bugs](https://github.com/manateeengine/zig-rgfw/issues?q=label%3Abug%20open%20sort%3Areactions-desc)
- [Newest Bugs](https://github.com/manateeengine/zig-rgfw/issues?q=label%3Abug%20open%20sort%3Acreated-desc)

## Support

While we don't provide any sort of support contracts / BAAs for our open source software (yet),
feel free to reach out to the maintainers at one of the following places:

- [GitHub Discussions](https://github.com/manateeengine/zig-rgfw/discussions)
- [GitHub Issues](https://github.com/manateeengine/zig-rgfw/issues)
- Contact options listed in the [Manatee GitHub Profile](https://github.com/manateeengine)

## Supporting the Development of Zig RGFW (and Other Manatee Projects)

If you want to support the active development of this project (or just show some love), we'd really
appreciate if you could do any of the following:

- Add a GitHub star to the repo
- Share the project with other developers
- Sponsor the Manatee Software Foundation on GitHub

Every little bit helps, thank you for supporting us!

## Contributing

Check out our [Contribution Guide](./CONTRIBUTING.md) for information about getting involved in the
development of Zig RGFW Runtime.

As a contributor, you can help us keep this project's community open and inclusive. Please read and
follow our [Code of Conduct](./CODE_OF_CONDUCT.md).

## Authors and Contributors

This project was created by [James Kienle](https://github.com/jrkienle). Key maintainers can be
found in the [Code Owners File](./.github/CODEOWNERS). For a complete list of contributors, check
out the [Contributors Page](https://github.com/manateeengine/zig-rgfw/graphs/contributors).

## Security

Check out our [Security Policy](./SECURITY.md) for more information about reporting vulnerabilities
and handling security bugs.

## License

This project is licensed under the MIT License. Check out [LICENSE.md](./LICENSE.md) for more
information.
