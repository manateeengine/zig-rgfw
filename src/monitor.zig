const rgfw = @import("rgfw.zig");

const RgfwArea = rgfw.RgfwArea;
const RgfwWindow = rgfw.RgfwWindow;

/// @brief Structure for monitor data
///
/// @remarks The original name for this struct in RGFW is `RGFW_monitor`.
///
/// @see [The RGFW Docs](https://colleagueriley.github.io/RGFW/docs/structRGFW__monitor.html)
pub const RgfwMonitor = extern struct {
    /// @brief X of the monitor workarea
    x: i32,
    /// @brief Y of the monitor workarea
    y: i32,
    /// @brief Monitor name
    name: [128]u8,
    /// @brief Monitor content scale X
    scale_x: f32,
    /// @brief Monitor content scale Y
    scale_y: f32,
    /// @brief Pixel ratio for monitor (1.0 for regular, 2.0 for hiDPI).
    pixel_ratio: f32,
    /// @brief Monitor physical width in inches
    phys_w: f32,
    /// @brief Monitor physical height in inches
    phys_h: f32,
};

/// @brief Monitor mode data.
///
/// @details Can be changed by the user (with functions).
///
/// @remarks The original name for this struct in RGFW is `RGFW_monitorMode`.
///
/// @see [The RGFW Docs](https://colleagueriley.github.io/RGFW/docs/structRGFW__monitorMode.html)
pub const RgfwMonitorMode = extern struct {
    /// @brief Monitor workarea size.
    area: RgfwArea,
    /// @brief Monitor refresh rate.
    refresh_rate: u32,
    red: u8,
    blue: u8,
    green: u8,
};

/// @brief Get the struct of the window's monitor.
///
/// @remarks The original name for this function in RGFW is `RGFW_window_getMonitor`.
///
/// @see [The RGFW Docs](https://colleagueriley.github.io/RGFW/docs/group__Monitor.html#ga648797c3385a4ec20bbc511dc49907d0)
pub fn rgfwWindowGetMonitor(win: *RgfwWindow) RgfwMonitor {
    return RGFW_window_getMonitor(win);
}

/// @brief No brief description was provided by RGFW.
///
/// @remarks The original name for this function in RGFW is `RGFW_window_scaleToMonitor`.
///
/// @see [The RGFW Docs](https://colleagueriley.github.io/RGFW/docs/group__Monitor.html#ga01c95a78b9ef65862ab06e7fc950a211)
pub fn rgfwWindowScaleToMonitor(win: *RgfwWindow) void {
    return RGFW_window_scaleToMonitor(win);
}

extern "rgfw" fn RGFW_window_getMonitor(win: *RgfwWindow) callconv(.c) RgfwMonitor;
extern "rgfw" fn RGFW_window_scaleToMonitor(win: *RgfwWindow) callconv(.c) void;
