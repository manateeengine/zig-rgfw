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

    return ZigRgfwModule{
        .module = module,
    };
}
