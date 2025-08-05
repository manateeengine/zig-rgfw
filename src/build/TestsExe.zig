//! A struct that creates and configures an exe used to run zig-rgfw tests.

const std = @import("std");
const BuildConfig = @import("BuildConfig.zig");
const ZigRgfwModule = @import("ZigRgfwModule.zig");

const TestsExe = @This();

/// The executable for all zig-rgfw tests.
tests: *std.Build.Step.Compile,

/// Initializes a new TestsExe struct with the provided BuildConfig and ZigRgfwModule.
pub fn init(b: *std.Build, config: *const BuildConfig, module: *const ZigRgfwModule) TestsExe {
    const tests_module = b.createModule(.{
        .optimize = config.optimize,
        .root_source_file = module.module.root_source_file,
        .strip = false,
        .target = config.target,
    });

    const tests = b.addTest(.{
        .name = "tests",
        .root_module = tests_module,
    });
    tests.linkSystemLibrary("objc");

    return TestsExe{
        .tests = tests,
    };
}

/// Adds a build command and step, allowing the exe to be run via "zig build test".
pub fn addTestStep(self: *const TestsExe) void {
    const b = self.tests.step.owner;
    const test_cmd = b.addRunArtifact(self.tests);
    test_cmd.step.dependOn(b.getInstallStep());

    const test_step = b.step("test", "Run unit tests");
    test_step.dependOn(&test_cmd.step);
}

/// Adds the tests to the build's check step
pub fn addToCheckStep(self: *const TestsExe, check_step: *std.Build.Step) void {
    check_step.dependOn(&self.tests.step);
}
