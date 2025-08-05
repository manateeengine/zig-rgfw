//! A struct that creates and configures a Zig module for zig-rgfw.

const std = @import("std");
const BuildConfig = @import("BuildConfig.zig");

const ZigRgfwModule = @This();

/// The primary zig-rgfw module
module: *std.Build.Module,

/// Initializes a new ZigRgfwModule struct with the provided BuildConfig.
pub fn init(b: *std.Build, build_config: *const BuildConfig) ZigRgfwModule {
    const module = b.createModule(.{
        .root_source_file = b.path("src/root.zig"),
        .optimize = build_config.optimize,
        .target = build_config.target,
    });

    // Since we're building RGFW as a part of the Zig build script, we'll need to configure it here
    // as well. To do this, we'll start defining the C macros that we want
    module.addCMacro("RGFW_IMPLEMENTATION", "");
    module.addCMacro("RGFW_bool", "u8");

    switch (build_config.target.result.os.tag) {
        .windows => {
            // These libraries are required on Win32 for whatever reason
            module.linkSystemLibrary("winmm", .{});
            module.linkSystemLibrary("gdi32", .{});

            module.addCMacro("RGFW_WINDOWS", "");
        },
        else => {},
    }

    // Zig has an open issue where header-only C libraries like RGFW can't be added to a module
    // without a C file. Once this is fixed, we shouldn't have to create a C file and should be
    // able to import the header only and be good to go!
    module.addIncludePath(.{ .cwd_relative = "./submodules/rgfw" });
    module.addCSourceFile(.{
        .file = b.addWriteFiles().add("rgfw.c", "#include <RGFW.h>"),
    });

    return ZigRgfwModule{
        .module = module,
    };
}
