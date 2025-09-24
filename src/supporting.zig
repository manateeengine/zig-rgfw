const rgfw = @import("rgfw.zig");

const RgfwEvent = rgfw.RgfwEvent;
const RgfwKey = rgfw.RgfwKey;
const RgfwMonitor = rgfw.RgfwMonitor;
const RgfwMouse = rgfw.RgfwMouse;
const RgfwWindow = rgfw.RgfwWindow;

// MARK: Functions

/// @brief Get the struct of the window's monitor.
///
/// @remarks The original name for this function in RGFW is `RGFW_window_getMonitor`.
pub fn rgfwGetInfo() ?*RgfwInfo {
    return RGFW_getInfo();
}

// MARK: Structs

pub const RgfwInfo = extern struct {
    root: *RgfwWindow,
    window_count: i32,
    event_len: i32,
    hidden_mouse: *RgfwMouse,
    events: [32]RgfwEvent,
    queued_events: bool,
    polled_events: bool,
    api_keycodes: [@intFromEnum(RgfwKey.rgfw_key_last)]u32,
    class_name: [*c]const u8,
    use_wayland_bool: bool,
    stop_check_events_bool: bool,
    timer_offset: u64,
    clipboard_data: [*c]const u8,
    files_source: [67600]u8,
    files: *anyopaque,
    monitors: *anyopaque,
    ns_app: *anyopaque,
    custom_view_classes: [2]*anyopaque,
    custom_window_delegate_class: *anyopaque,
};

// MARK: C Functions

extern "rgfw" fn RGFW_getInfo() callconv(.c) ?*RgfwInfo;
