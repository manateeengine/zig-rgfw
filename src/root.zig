
const rgfw = @import("rgfw.zig");
const window_management = @import("window_management.zig");

// Root files need to import all files with tests inside of a test block otherwise tests won't run
test {
    _ = rgfw;
    _ = window_management;
}
