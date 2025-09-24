//! @brief A struct that creates and configures a static library for RGFW.
//!
//! @details
//! This struct handles compiling RGFW as a static library. RGFW is found in a Git Submodule in the
//! folder `<repo_root>/submodules/rgfw`.

const std = @import("std");
const BuildConfig = @import("BuildConfig.zig");
const ZigRgfwModule = @import("ZigRgfwModule.zig");

const RgfwLib = @This();

/// @brief The Zig build step representing the static library.
lib: *std.Build.Step.Compile,

/// @brief Creates a new RgfwLib struct with the provided BuildConfig.
///
/// @example
/// ```zig
/// const rgfw_lib = RgfwLib.init(b, &build_config);
/// ```
pub fn init(b: *std.Build, build_config: *const BuildConfig) RgfwLib {
    const rgfw_lib_module = b.createModule(.{
        .optimize = build_config.optimize,
        .target = build_config.target,
    });
    const lib = b.addLibrary(.{
        .name = "rgfw",
        .root_module = rgfw_lib_module,
    });

    // LibC is required to build RGFW. This is something I'd like to distance myself from in future
    // Manatee development, but RGFW gets me where I need to be for now, so this is fine
    lib.root_module.link_libc = true;

    // Cross-platform configuration
    lib.root_module.addCMacro("RGFW_IMPLEMENTATION", "");
    lib.root_module.addCMacro("RGFW_bool", "u8");

    // Since RGFW is a single-header, some C Macros have to be set in order to let the compiler
    // know which target we're building for. This has to be done since C doesn't have all of the
    // amazing comptime magic that Zig does (yay for newer tooling!).
    switch (build_config.target.result.os.tag) {
        .windows => {
            lib.root_module.addCMacro("RGFW_WINDOWS", "");

            lib.root_module.linkSystemLibrary("winmm", .{});
            lib.root_module.linkSystemLibrary("gdi32", .{});
        },
        .macos => {
            lib.root_module.addCMacro("RGFW_MACOS", "");

            lib.root_module.linkFramework("Cocoa", .{});
            lib.root_module.linkFramework("IOKit", .{});
        },
        else => {},
    }

    // The following C Macros need to be set for all platforms
    lib.root_module.addCMacro("RGFW_IMPLEMENTATION", "");
    lib.root_module.addCMacro("RGFW_bool", "u8");

    // Zig has an open issue where header-only C libraries like RGFW can't be added to a module
    // without a C file. Once this is fixed, we shouldn't have to create a C file and should be
    // able to import the header only and be good to go!
    lib.addIncludePath(.{ .cwd_relative = "./submodules/rgfw" });
    lib.addCSourceFile(.{
        .file = b.addWriteFiles().add("rgfw.c", "#include <RGFW.h>"),
    });

    return .{
        .lib = lib,
    };
}

/// @brief Links the static library to the provided zig module
pub fn linkToModule(self: *const RgfwLib, module: *const ZigRgfwModule) void {
    module.module.linkLibrary(self.lib);
}
