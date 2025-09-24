const rgfw = @import("rgfw.zig");

const RgfwMonitor = rgfw.RgfwMonitor;
const RgfwWindow = rgfw.RgfwWindow;

// MARK: Functions

/// @brief Get the struct of the window's monitor.
///
/// @remarks The original name for this function in RGFW is `RGFW_window_getMonitor`.
pub fn rgfwWindowGetMonitor(win: *RgfwWindow) RgfwMonitor {
    return RGFW_window_getMonitor(win);
}

/// @brief Scale the window to the monitor.
///
/// @details This is run by default if the user uses the arg `rgfwScaleToMonitor` during
///              window creation
///
/// @remarks The original name for this function in RGFW is `RGFW_window_scaleToMonitor`.
pub fn rgfwWindowScaleToMonitor(win: *RgfwWindow) void {
    return RGFW_window_scaleToMonitor(win);
}

// MARK: C Functions

extern "c" fn RGFW_window_getMonitor(win: *RgfwWindow) callconv(.c) RgfwMonitor;
extern "c" fn RGFW_window_scaleToMonitor(win: *RgfwWindow) callconv(.c) void;
