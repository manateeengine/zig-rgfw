const builtin = @import("builtin");

// MARK: Enums

/// @brief Event Codes.
///
/// @remarks The original name for this struct in RGFW is `RGFW_eventType`.
pub const RgfwEventType = enum(u8) {
    /// @brief No event has been sent.
    ///
    /// @remarks The original name for this type in RGFW is `RGFW_eventNone`.
    rgfw_event_none = 0,
    /// @brief A key has been pressed.
    ///
    /// @remarks The original name for this type in RGFW is `RGFW_keyPressed`.
    rgfw_key_pressed = 1,
    /// @brief A key has been released.
    ///
    /// @remarks The original name for this type in RGFW is `RGFW_keyReleased`.
    rgfw_key_released = 2,
    /// @brief A mouse button has been pressed (left, middle, right).
    ///
    /// @remarks The original name for this type in RGFW is `RGFW_mouseButtonPressed`.
    rgfw_mouse_button_pressed = 3,
    /// @brief A mouse button has been released (left, middle, right).
    ///
    /// @remarks The original name for this type in RGFW is `RGFW_mouseButtonReleased`.
    rgfw_mouse_button_released = 4,
    /// @brief A mouse scroll event.
    ///
    /// @remarks The original name for this type in RGFW is `RGFW_mouseScroll`.
    rgfw_mouse_scroll = 5,
    /// @brief The position of the mouse has been changed.
    ///
    /// @remarks The original name for this type in RGFW is `RGFW_mousePosChanged`.
    rgfw_mouse_pos_changed = 6,
    /// @brief The window was moved (by the user).
    ///
    /// @remarks The original name for this type in RGFW is `RGFW_windowMoved`.
    rgfw_window_moved = 7,
    /// @brief The window was resized (by the user).
    ///
    /// @remarks On WASM this means the browser was resized.
    ///
    /// @remarks The original name for this type in RGFW is `RGFW_windowResized`.
    rgfw_window_resized = 8,
    /// @brief Window is in focus now.
    ///
    /// @remarks The original name for this type in RGFW is `RGFW_windowFocusIn`.
    rgfw_focus_in = 9,
    /// @brief Window is out of focus now.
    ///
    /// @remarks The original name for this type in RGFW is `RGFW_windowFocusOut`.
    rgfw_focus_out = 10,
    /// @brief mouse entered the window.
    ///
    /// @remarks The original name for this type in RGFW is `RGFW_mouseEnter`.
    rgfw_mouse_enter = 11,
    /// @brief Mouse left the window.
    ///
    /// @remarks The original name for this type in RGFW is `RGFW_mouseLeave`.
    rgfw_mouse_leave = 12,
    /// @brief The window content needs to be refreshed.
    ///
    /// @remarks The original name for this type in RGFW is `RGFW_refresh`.
    rgfw_window_refresh = 13,
    /// @brief The user clicked the quit button.
    ///
    /// @remarks The original name for this type in RGFW is `RGFW_quit`.
    rgfw_quit = 14,
    /// @brief A file has been dropped into the window.
    ///
    /// @remarks The original name for this type in RGFW is `RGFW_dataDrop`.
    rgfw_data_drop = 15,
    /// @brief The start of a drag and drop event, when the file is being dragged.
    ///
    /// @remarks The original name for this type in RGFW is `RGFW_dataDrag`.
    rgfw_data_drag = 16,
    /// @brief The window was maximized.
    ///
    /// @remarks The original name for this type in RGFW is `RGFW_windowMaximized`.
    rgfw_window_maximized = 17,
    /// @brief The window was minimized.
    ///
    /// @remarks The original name for this type in RGFW is `RGFW_windowMinimized`.
    rgfw_window_minimized = 18,
    /// @brief The window was restored.
    ///
    /// @remarks The original name for this type in RGFW is `RGFW_windowRestored`.
    rgfw_window_restored = 19,
    /// @brief Content scale factor changed.
    ///
    /// @remarks The original name for this type in RGFW is `RGFW_scaleUpdated`.
    rgfw_scale_updated = 20,
};

/// @brief No brief description was provided by RGFW.
///
/// @remarks The original name for this enum in RGFW is `RGFW_eventWait`.
pub const RgfwEventWait = enum(i32) {
    /// @brief No brief description was provided by RGFW.
    ///
    /// @remarks The original name for this type in RGFW is `RGFW_eventNoWait`.
    rgfw_event_no_wait = 0,
    /// @brief No brief description was provided by RGFW.
    ///
    /// @remarks The original name for this type in RGFW is `RGFW_eventWaitNext`.
    rgfw_event_wait_next = -1,
};

/// @brief No brief description was provided by RGFW.
///
/// @remarks The original name for this enum in RGFW is `RGFW_format`.
pub const RgfwFormat = enum(u8) {
    /// @brief 8-bit RGB (3 channels)
    rgfw_format_rgb8 = 0,
    /// @brief 8-bit BGR (3 channels)
    rgfw_format_bgr8 = 1,
    /// @brief 8-bit RGBA (4 channels)
    rgfw_format_rgba8 = 2,
    /// @brief 8-bit RGBA (4 channels)
    rgfw_format_argb8 = 3,
    /// @brief 8-bit BGRA (4 channels)
    rgfw_format_bgra8 = 4,
    /// @brief 8-bit BGRA (4 channels)
    rgfw_format_abgr8 = 5,
    rgfw_format_count = 6,
};

/// @brief Key codes and mouse icon enums
///
/// @remarks The original name for this enum in RGFW is `RGFW_key`.
pub const RgfwKey = enum(u8) {
    rgfw_key_null = 0,
    rgfw_escape = '\x1b',
    rgfw_backtick = '`',
    rgfw_0 = '0',
    rgfw_1 = '1',
    rgfw_2 = '2',
    rgfw_3 = '3',
    rgfw_4 = '4',
    rgfw_5 = '5',
    rgfw_6 = '6',
    rgfw_7 = '7',
    rgfw_8 = '8',
    rgfw_9 = '9',
    rgfw_minus = '-',
    rgfw_equals = '=',
    rgfw_backspace = '\x08',
    rgfw_tab = '\t',
    rgfw_space = ' ',
    rgfw_a = 'a',
    rgfw_b = 'b',
    rgfw_c = 'c',
    rgfw_d = 'd',
    rgfw_e = 'e',
    rgfw_f = 'f',
    rgfw_g = 'g',
    rgfw_h = 'h',
    rgfw_i = 'i',
    rgfw_j = 'j',
    rgfw_k = 'k',
    rgfw_l = 'l',
    rgfw_m = 'm',
    rgfw_n = 'n',
    rgfw_o = 'o',
    rgfw_p = 'p',
    rgfw_q = 'q',
    rgfw_r = 'r',
    rgfw_s = 's',
    rgfw_t = 't',
    rgfw_u = 'u',
    rgfw_v = 'v',
    rgfw_w = 'w',
    rgfw_x = 'x',
    rgfw_y = 'y',
    rgfw_z = 'z',
    rgfw_period = '.',
    rgfw_comma = ',',
    rgfw_slash = '/',
    rgfw_bracket = '[',
    rgfw_close_bracket = ']',
    rgfw_semicolon = ';',
    rgfw_apostrophe = '\'',
    rgfw_back_slash = '\\',
    rgfw_return = '\n',
    rgfw_delete = '\x7F',
    rgfw_f1,
    rgfw_f2,
    rgfw_f3,
    rgfw_f4,
    rgfw_f5,
    rgfw_f6,
    rgfw_f7,
    rgfw_f8,
    rgfw_f9,
    rgfw_f10,
    rgfw_f11,
    rgfw_f12,
    rgfw_f13,
    rgfw_f14,
    rgfw_f15,
    rgfw_f16,
    rgfw_f17,
    rgfw_f18,
    rgfw_f19,
    rgfw_f20,
    rgfw_f21,
    rgfw_f22,
    rgfw_f23,
    rgfw_f24,
    rgfw_f25,
    rgfw_caps_lock,
    rgfw_shift_l,
    rgfw_control_l,
    rgfw_alt_l,
    rgfw_super_l,
    rgfw_shift_r,
    rgfw_control_r,
    rgfw_alt_r,
    rgfw_super_r,
    rgfw_up,
    rgfw_down,
    rgfw_left,
    rgfw_right,
    rgfw_insert,
    rgfw_menu,
    rgfw_end,
    rgfw_home,
    rgfw_page_up,
    rgfw_page_down,
    rgfw_num_lock,
    rgfw_kp_slash,
    rgfw_kp_multiply,
    rgfw_kp_plus,
    rgfw_kp_minus,
    rgfw_kp_equal,
    rgfw_kp_1,
    rgfw_kp_2,
    rgfw_kp_3,
    rgfw_kp_4,
    rgfw_kp_5,
    rgfw_kp_6,
    rgfw_kp_7,
    rgfw_kp_8,
    rgfw_kp_9,
    rgfw_kp_0,
    rgfw_kp_period,
    rgfw_kp_return,
    rgfw_scroll_lock,
    rgfw_print_screen,
    rgfw_pause,
    rgfw_world_1,
    rgfw_world_2,
    /// @brief Padding for alignment ~(175 by default)
    rgfw_key_last,
};

/// @brief mouse button codes (`RGFWEvent.button`)
///
/// @remarks The original name for this enum in RGFW is `RGFW_mouseButton`.
pub const RgfwMouseButton = enum(u8) {
    /// @brief Left mouse button is pressed
    rgfw_mouse_left = 0,
    /// @brief Mouse-wheel-button is pressed
    rgfw_mouse_middle = 1,
    /// @brief Right mouse button is pressed
    rgfw_mouse_right = 2,
    /// @brief Mouse wheel is scrolling up.
    rgfw_mouse_scroll_up = 3,
    /// @brief Mouse wheel is scrolling down.
    rgfw_mouse_scroll_down = 4,
    rgfw_mouse_misc_1 = 5,
    rgfw_mouse_misc_2 = 6,
    rgfw_mouse_misc_3 = 7,
    rgfw_mouse_misc_4 = 8,
    rgfw_mouse_misc_5 = 9,
    rgfw_mouse_final,
};

// MARK: Functions

/// @brief Runs whatever `RGFW_ALLOC` was/is at compile time.
///
/// @warning This probably shouldn't be used in Zig but it's here if you need it.
///
/// @remarks The original name for this function in RGFW is `RGFW_alloc`.
pub fn rgfwAlloc(size: usize) *anyopaque {
    return RGFW_alloc(size);
}

/// @brief Copy image to another image, respecting each image's format.
///
/// @remarks The original name for this function in RGFW is `RGFW_alloc`.
pub fn rgfwCopyImageData(dest_data: *u8, w: i32, h: i32, dest_format: RgfwFormat, src_data: *u8, src_format: RgfwFormat) void {
    return RGFW_copyImageData(dest_data, w, h, dest_format, src_data, src_format);
}

/// @brief No brief description was provided by RGFW.
///
/// @remarks The original name for this function in RGFW is `RGFW_createSurface`.
pub fn rgfwCreateSurface(data: *u8, w: i32, h: i32, format: RgfwFormat) *RgfwSurface {
    return RGFW_createSurface(data, w, h, format);
}

/// @brief No brief description was provided by RGFW.
///
/// @remarks The original name for this function in RGFW is `RGFW_createSurfacePtr`.
pub fn rgfwCreateSurfacePtr(data: *u8, w: i32, h: i32, format: RgfwFormat, surface: *RgfwSurface) bool {
    return RGFW_createSurfacePtr(data, w, h, format, surface);
}

/// @brief Function to create a window and struct.
///
/// @remarks The original name for this function in RGFW is `RGFW_createWindow`.
///
/// @see [The RGFW Docs](https://colleagueriley.github.io/RGFW/docs/group__Window__management.html#gaf8a8eaf0d6031adb217117e43f161a3c)
pub fn rgfwCreateWindow(name: []const u8, x: i32, y: i32, w: i32, h: i32, flags: RgfwWindowFlags) *RgfwWindow {
    return RGFW_createWindow(name.ptr, x, y, w, h, @bitCast(flags));
}

/// @brief Function to create a window (without allocating a window struct)
///
/// @remarks The original name for this function in RGFW is `RGFW_createWindowPtr`.
///
/// @see [The RGFW Docs](https://colleagueriley.github.io/RGFW/docs/group__Window__management.html#gacd2a85f50be8de9991ce67e760ee1c7a)
pub fn rgfwCreateWindowPtr(name: []const u8, x: i32, y: i32, w: i32, h: i32, flags: RgfwWindowFlags, win: *RgfwWindow) *RgfwWindow {
    return RGFW_createWindowPtr(name.ptr, x, y, w, h, @bitCast(flags), win);
}

/// @brief Runs whatever `RGFW_FREE` was/is at compile time.
///
/// @warning This probably shouldn't be used in Zig but it's here if you need it.
///
/// @remarks The original name for this function in RGFW is `RGFW_free`.
pub fn rgfwFree(ptr: *anyopaque) void {
    return RGFW_free(ptr);
}

/// @brief Frees RGFW_mouse data.
///
/// @remarks The original name for this function in RGFW is `RGFW_freeMouse`.
pub fn rgfwFreeMouse(mouse: *RgfwMouse) void {
    return RGFW_freeMouse(mouse);
}

/// @brief No brief description was provided by RGFW.
///
/// @remarks The original name for this function in RGFW is `RGFW_getDisplay_Wayland`.
pub fn rgfwGetDisplayWayland() *anyopaque {
    return RGFW_getDisplay_Wayland();
}

/// @brief No brief description was provided by RGFW.
///
/// @remarks The original name for this function in RGFW is `RGFW_getDisplay_X11`.
pub fn rgfwGetDisplayX11() void {
    return RGFW_getDisplay_X11();
}

/// @brief No brief description was provided by RGFW.
///
/// @remarks The original name for this function in RGFW is `RGFW_getLayer_OSX`.
pub fn rgfwGetLayerOsx() void {
    return RGFW_getLayer_OSX();
}

/// @brief Get an array of all the monitors (max 6).
///
/// @remarks The original name for this function in RGFW is `RGFW_getMonitors`.
pub fn rgfwGetMonitors(len: *usize) *[]RgfwMonitor {
    return RGFW_getMonitors(len);
}

/// @brief Get the primary monitor.
///
/// @remarks The original name for this function in RGFW is `RGFW_getPrimaryMonitor`.
pub fn rgfwGetPrimaryMonitor() RgfwMonitor {
    return RGFW_getPrimaryMonitor();
}

/// @brief Loads mouse icon from bitmap (similar to RGFW_window_setIcon).
///
/// @remarks The original name for this function in RGFW is `RGFW_loadMouse`.
pub fn rgfwLoadMouse(data: *u8, w: i32, h: i32, format: RgfwFormat) *RgfwMouse {
    return RGFW_loadMouse(data, w, h, format);
}

/// @brief Check if 2 monitor modes are the same
///
/// @remarks The original name for this function in RGFW is `RGFW_monitorModeCompare`.
pub fn rgfwMonitorModeCompare(mon: RgfwMonitor, mon2: RgfwMonitor, request: RgfwModeRequest) bool {
    return RGFW_monitorModeCompare(mon, mon2, request);
}

/// @brief Scale monitor to window size.
///
/// @remarks The original name for this function in RGFW is `RGFW_monitor_scaleToWindow`.
pub fn rgfwMonitorScaleToWindow(mon: RgfwMonitor, win: *RgfwWindow) bool {
    return RGFW_monitor_scaleToWindow(mon, win);
}

/// @brief Request a specific mode
///
/// @remarks The original name for this function in RGFW is `RGFW_monitor_requestMode`.
pub fn rgfwMonitorRequestMode(mon: RgfwMonitor, mon2: RgfwMonitor, request: RgfwModeRequest) bool {
    return RGFW_monitor_requestMode(mon, mon2, request);
}

/// @brief (Cocoa only) change directory to resource folder.
///
/// @remarks The original name for this function in RGFW is `RGFW_moveToMacOSResourceDir`.
pub fn rgfwMoveToMacOsResourceDir() void {
    return RGFW_moveToMacOSResourceDir();
}

/// @brief Check all the events until there are none left and updates window structure attributes.
///
/// @details Adds them to a queue for `rgfwWindowCheckEvent` to check if queueEvents is `true`.
///
/// @remarks The original name for this function in RGFW is `RGFW_pollEvents`.
pub fn rgfwPollEvents() void {
    return RGFW_pollEvents();
}

/// @brief The class name for X11 and WinAPI.
///
/// @details Apps with the same class will be grouped by the WM by default the class name will ==
///          the root window's name.
///
/// @remarks The original name for this function in RGFW is `RGFW_setClassName`.
///
/// @see [The RGFW Docs](https://colleagueriley.github.io/RGFW/docs/group__Window__management.html#gad4e025c3958a7118fd3ec5728cc7c43e)
pub fn rgfwSetClassName(name: []const u8) void {
    return RGFW_setClassName(name.ptr);
}

/// @brief If you you want events to be queued or not.
///
/// @details This is enabled when the queue is checked with `rgfwWindowCheckQueuedEvent` or
/// `rgfwWindowCheckEvent`, otherwise it's disabled by default.
///
/// @remarks The original name for this function in RGFW is `RGFW_setQueueEvents`.
pub fn rgfwSetQueueEvents(queue: bool) void {
    return RGFW_setQueueEvents(queue);
}

/// @brief X11 instance name (window name will by used by default).
///
/// @remarks The original name for this function in RGFW is `RGFW_setXInstName`.
///
/// @see [The RGFW Docs](https://colleagueriley.github.io/RGFW/docs/group__Window__management.html#ga01315659b679358f434b95ff9d66935f)
pub fn rgfwSetXInstName(name: []const u8) void {
    return RGFW_setXInstName(name.ptr);
}

/// @brief No brief description was provided by RGFW.
///
/// @remarks The original name for this function in RGFW is `RGFW_sizeofNativeImage`.
pub fn rgfwSizeOfNativeImage() usize {
    return RGFW_sizeofNativeImage();
}

/// @brief No brief description was provided by RGFW.
///
/// @remarks The original name for this function in RGFW is `RGFW_sizeofSurface`.
pub fn rgfwSizeOfSurface() usize {
    return RGFW_sizeofSurface();
}

/// @brief No brief description was provided by RGFW.
///
/// @remarks The original name for this function in RGFW is `RGFW_sizeofWindow`.
pub fn rgfwSizeOfWindow() usize {
    return RGFW_sizeofWindow();
}

/// @brief No brief description was provided by RGFW.
///
/// @remarks The original name for this function in RGFW is `RGFW_sizeofWindowSrc`.
pub fn rgfwSizeOfWindowSrc() usize {
    return RGFW_sizeofWindowSrc();
}

/// @brief Tell `rgfwWaitForEvent` to stop waiting (to be ran from another thread).
///
/// @remarks The original name for this function in RGFW is `RGFW_stopCheckEvents`.
pub fn rgfwStopCheckEvents() void {
    return RGFW_stopCheckEvents();
}

/// @brief Free the surface pointer and buffers used for software rendering within the window.
///
/// @remarks The original name for this function in RGFW is `RGFW_surface_free`.
pub fn rgfwSurfaceFree(surface: *RgfwSurface) void {
    return RGFW_surface_free(surface);
}

/// @brief Free only the buffers used for software rendering within the window.
///
/// @remarks The original name for this function in RGFW is `RGFW_surface_freePtr`.
pub fn rgfwSurfaceFreePtr(surface: *RgfwSurface) void {
    return RGFW_surface_freePtr(surface);
}

/// @brief No brief description was provided by RGFW.
///
/// @remarks The original name for this function in RGFW is `RGFW_surface_getNativeImage`.
pub fn rgfwSurfaceGetNativeImage(surface: *RgfwSurface) *RgfwNativeImage {
    return RGFW_surface_getNativeImage(surface);
}

/// @brief No brief description was provided by RGFW.
///
/// @remarks The original name for this function in RGFW is `RGFW_useWayland`.
pub fn rgfwUseWayland(wayland: bool) void {
    return RGFW_useWayland(wayland);
}

/// @brief No brief description was provided by RGFW.
///
/// @remarks The original name for this function in RGFW is `RGFW_usingWayland`.
pub fn rgfwUsingWayland() bool {
    return RGFW_usingWayland();
}

/// @brief Sleep until RGFW gets an event or the timer ends (defined by OS).
///
/// @remarks The original name for this function in RGFW is `RGFW_waitForEvent`.
pub fn rgfwWaitForEvent(wait_ms: i32) void {
    return RGFW_waitForEvent(wait_ms);
}

/// @brief Render the software rendering buffer.
///
/// @remarks The original name for this function in RGFW is `RGFW_window_blitSurface`.
pub fn rgfwWindowBlitSurface(win: *RgfwWindow, surface: *RgfwSurface) void {
    return RGFW_window_blitSurface(win, surface);
}

/// @brief No brief description was provided by RGFW.
///
/// @remarks The original name for this function in RGFW is `RGFW_window_createSurface`.
pub fn rgfwWindowCreateSurface(win: *RgfwWindow, data: *u8, w: i32, h: i32, format: RgfwFormat) *RgfwSurface {
    return RGFW_window_createSurface(win, data, w, h, format);
}

/// @brief No brief description was provided by RGFW.
///
/// @remarks The original name for this function in RGFW is `RGFW_window_createSurfacePtr`.
pub fn rgfwWindowCreateSurfacePtr(win: *RgfwWindow, data: *u8, w: i32, h: i32, format: RgfwFormat, surface: *RgfwSurface) bool {
    return RGFW_window_createSurfacePtr(win, data, w, h, format, surface);
}

/// @brief No brief description was provided by RGFW.
///
/// @remarks The original name for this function in RGFW is `RGFW_window_getEnabledEvents`.
pub fn rgfwWindowGetEnabledEvents(win: *RgfwWindow) RgfwEventFlag {
    return @as(RGFW_window_getEnabledEvents(win), RgfwEventFlag);
}

/// @brief No brief description was provided by RGFW.
///
/// @remarks The original name for this function in RGFW is `RGFW_window_getExitKey`.
pub fn rgfwWindowGetExitKey(win: *RgfwWindow) RgfwKey {
    return RGFW_window_getExitKey(win);
}

/// @brief No brief description was provided by RGFW.
///
/// @remarks The original name for this function in RGFW is `RGFW_window_getFlags`.
pub fn rgfwWindowGetFlags(win: *RgfwWindow) RgfwWindowFlags {
    return @as(RGFW_window_getFlags(win), RgfwWindowFlags);
}

/// @brief No brief description was provided by RGFW.
///
/// @remarks The original name for this function in RGFW is `RGFW_window_getHDC`.
pub fn rgfwWindowGetHdc(win: *RgfwWindow) u64 {
    return RGFW_window_getHDC(win);
}

/// @brief No brief description was provided by RGFW.
///
/// @remarks The original name for this function in RGFW is `RGFW_window_getHWND`.
pub fn rgfwWindowGetHwnd(win: *RgfwWindow) u64 {
    return RGFW_window_getHWND(win);
}

/// @brief No brief description was provided by RGFW.
///
/// @remarks The original name for this function in RGFW is `RGFW_window_getPosition`.
pub fn rgfwWindowGetPosition(win: *RgfwWindow, x: *i32, y: *i32) bool {
    return RGFW_window_getPosition(win, x, y);
}

/// @brief No brief description was provided by RGFW.
///
/// @remarks The original name for this function in RGFW is `RGFW_window_getSize`.
pub fn rgfwWindowGetSize(win: *RgfwWindow, x: *i32, y: *i32) bool {
    return RGFW_window_getSize(win, x, y);
}

/// @brief No brief description was provided by RGFW.
///
/// @remarks The original name for this function in RGFW is `RGFW_window_getSrc`.
pub fn rgfwWindowGetSrc(win: *RgfwWindow) *RgfwWindowSrc {
    return RGFW_window_getSrc(win);
}

/// @brief No brief description was provided by RGFW.
///
/// @remarks The original name for this function in RGFW is `RGFW_window_getUserPtr`.
pub fn rgfwWindowGetUserPtr(win: *RgfwWindow) *anyopaque {
    return RGFW_window_getUserPtr(win);
}

/// @brief No brief description was provided by RGFW.
///
/// @remarks The original name for this function in RGFW is `RGFW_window_getViewOSX`.
pub fn rgfwWindowGetViewOsx(win: *RgfwWindow) u64 {
    return RGFW_window_getView_OSX(win);
}

/// @brief No brief description was provided by RGFW.
///
/// @remarks The original name for this function in RGFW is `RGFW_window_getViewOSX`.
pub fn rgfwWindowGetWindowOsx(win: *RgfwWindow) u64 {
    return RGFW_window_getWindow_OSX(win);
}

/// @brief No brief description was provided by RGFW.
///
/// @remarks The original name for this function in RGFW is `RGFW_window_getWindow_Wayland`.
pub fn rgfwWindowGetWindowWayland(win: *RgfwWindow) u64 {
    return RGFW_window_getWindow_Wayland(win);
}

/// @brief No brief description was provided by RGFW.
///
/// @remarks The original name for this function in RGFW is `RGFW_window_getWindow_X11`.
pub fn rgfwWindowGetWindowX11(win: *RgfwWindow) u64 {
    return RGFW_window_getWindow_X11(win);
}

/// @brief No brief description was provided by RGFW.
///
/// @remarks The original name for this function in RGFW is `RGFW_window_setEventState`.
pub fn rgfwWindowSetDisabledEvents(win: *RgfwWindow, key: RgfwKey) void {
    return RGFW_window_setEventState(win, key);
}

/// @brief No brief description was provided by RGFW.
///
/// @remarks The original name for this function in RGFW is `RGFW_window_setEnabledEvents`.
pub fn rgfwWindowSetEnabledEvents(win: *RgfwWindow, events: RgfwEventFlag) void {
    return RGFW_window_setEnabledEvents(win, @bitCast(events));
}

/// @brief No brief description was provided by RGFW.
///
/// @remarks The original name for this function in RGFW is `RGFW_window_setEventState`.
pub fn rgfwWindowSetEventState(win: *RgfwWindow, events: RgfwEventFlag, state: bool) void {
    return RGFW_window_setEventState(win, @bitCast(events), state);
}

/// @brief No brief description was provided by RGFW.
///
/// @remarks The original name for this function in RGFW is `RGFW_window_setExitKey`.
pub fn rgfwWindowSetExitKey(win: *RgfwWindow, key: RgfwKey) void {
    return RGFW_window_setExitKey(win, key);
}

/// @brief No brief description was provided by RGFW.
///
/// @remarks The original name for this function in RGFW is `RGFW_window_setLayerOsx`.
pub fn rgfwWindowSetLayerOsx(win: *RgfwWindow, layer: *anyopaque) void {
    return RGFW_window_setLayerOsx(win, layer);
}

/// @brief No brief description was provided by RGFW.
///
/// @remarks The original name for this function in RGFW is `RGFW_window_setUserPtr`.
pub fn rgfwWindowSetUserPtr(win: *RgfwWindow, ptr: *anyopaque) void {
    return RGFW_window_setUserPtr(win, ptr);
}

// MARK: Opaque Types

/// @brief Loads mouse icon from bitmap (similar to RGFW_window_setIcon).
///
/// @warning Icon NOT resized by default
///
/// @remarks The original name for this type in RGFW is `RGFW_mouse`.
pub const RgfwMouse = opaque {};

// MARK: Packed Structs

/// @brief No brief description was provided by RGFW.
///
/// @remarks The original name for this struct in RGFW is `RGFW_eventFlag`. This was originally an
///          enum but has been converted to a packed struct for a better Zig developer experience.
pub const RgfwEventFlag = packed struct(u32) {
    _reserved_bit_0: u0 = 0,
    /// @brief No brief description was provided by RGFW.
    ///
    /// @remarks The original name for this member in RGFW is `RGFW_keyPressedFlag`.
    rgfw_key_pressed_flag: bool = false,
    /// @brief No brief description was provided by RGFW.
    ///
    /// @remarks The original name for this member in RGFW is `RGFW_keyReleasedFlag`.
    rgfw_key_released_flag: bool = false,
    /// @brief No brief description was provided by RGFW.
    ///
    /// @remarks The original name for this member in RGFW is `RGFW_mouseButtonPressedFlag`.
    rgfw_mouse_button_pressed_flag: bool = false,
    /// @brief No brief description was provided by RGFW.
    ///
    /// @remarks The original name for this member in RGFW is `RGFW_mouseButtonReleasedFlag`.
    rgfw_mouse_button_released_flag: bool = false,
    /// @brief No brief description was provided by RGFW.
    ///
    /// @remarks The original name for this member in RGFW is `RGFW_mouseScrollFlag`.
    rgfw_mouse_scroll_flag: bool = false,
    /// @brief No brief description was provided by RGFW.
    ///
    /// @remarks The original name for this member in RGFW is `RGFW_mousePosChangedFlag`.
    rgfw_mouse_pos_changed_flag: bool = false,
    /// @brief No brief description was provided by RGFW.
    ///
    /// @remarks The original name for this member in RGFW is `RGFW_windowMovedFlag`.
    rgfw_window_moved_flag: bool = false,
    /// @brief No brief description was provided by RGFW.
    ///
    /// @remarks The original name for this member in RGFW is `RGFW_windowResizedFlag`.
    rgfw_window_resized_flag: bool = false,
    /// @brief No brief description was provided by RGFW.
    ///
    /// @remarks The original name for this member in RGFW is `RGFW_focusInFlag`.
    rgfw_focus_in_flag: bool = false,
    /// @brief No brief description was provided by RGFW.
    ///
    /// @remarks The original name for this member in RGFW is `RGFW_focusOutFlag`.
    rgfw_focus_out_flag: bool = false,
    /// @brief No brief description was provided by RGFW.
    ///
    /// @remarks The original name for this member in RGFW is `RGFW_mouseEnterFlag`.
    rgfw_mouse_enter_flag: bool = false,
    /// @brief No brief description was provided by RGFW.
    ///
    /// @remarks The original name for this member in RGFW is `RGFW_mouseLeaveFlag`.
    rgfw_mouse_leave_flag: bool = false,
    /// @brief No brief description was provided by RGFW.
    ///
    /// @remarks The original name for this member in RGFW is `RGFW_windowRefreshFlag`.
    rgfw_window_refresh_flag: bool = false,
    /// @brief No brief description was provided by RGFW.
    ///
    /// @remarks The original name for this member in RGFW is `RGFW_quitFlag`.
    rgfw_quit_flag: bool = false,
    /// @brief No brief description was provided by RGFW.
    ///
    /// @remarks The original name for this member in RGFW is `RGFW_dataDropFlag`.
    rgfw_data_drop_flag: bool = false,
    /// @brief No brief description was provided by RGFW.
    ///
    /// @remarks The original name for this member in RGFW is `RGFW_dataDragFlag`.
    rgfw_data_drag_flag: bool = false,
    /// @brief No brief description was provided by RGFW.
    ///
    /// @remarks The original name for this member in RGFW is `RGFW_windowMaximizedFlag`.
    rgfw_window_maximized_flag: bool = false,
    /// @brief No brief description was provided by RGFW.
    ///
    /// @remarks The original name for this member in RGFW is `RGFW_windowMinimizedFlag`.
    rgfw_window_minimized_flag: bool = false,
    /// @brief No brief description was provided by RGFW.
    ///
    /// @remarks The original name for this member in RGFW is `RGFW_windowRestoredFlag`.
    rgfw_window_restored_flag: bool = false,
    /// @brief No brief description was provided by RGFW.
    ///
    /// @remarks The original name for this member in RGFW is `RGFW_scaleUpdatedFlag`.
    rgfw_scale_updated_flag: bool = false,
};

/// @brief For `RgfwEvent.lock_state`
///
/// @remarks The original name for this struct in RGFW is `RGFW_keyMod`. This was originally an
///          enum but has been converted to a packed struct for a better Zig developer experience.
pub const RgfwKeyMod = packed struct(u8) {
    rgfw_mod_caps_lock: bool = false,
    rgfw_mod_num_lock: bool = false,
    rgfw_mod_control: bool = false,
    rgfw_mod_alt: bool = false,
    rgfw_mod_shift: bool = false,
    rgfw_mod_super: bool = false,
    rgfw_mod_scroll_lock: bool = false,
    _: u1 = 0,
};

/// @brief No brief description was provided by RGFW.
///
/// @remarks The original name for this struct in RGFW is `RGFW_modeRequest`. This was originally
///          an enum but has been converted to a packed struct for a better Zig developer
///          experience.
pub const RgfwModeRequest = packed struct(u8) {
    /// @brief Scale the monitor size.
    ///
    /// @remarks The original name for this member in RGFW is `RGFW_monitorScale`.
    rgfw_monitor_scale: bool = false,
    /// @brief Change the refresh rate.
    ///
    /// @remarks The original name for this member in RGFW is `RGFW_monitorRefresh`.
    rgfw_monitor_refresh: bool = false,
    /// @brief Change the monitor RGB bits size.
    ///
    /// @remarks The original name for this member in RGFW is `RGFW_monitorRefresh`.
    rgfw_monitor_rgb: bool = false,
    _: u5 = 0,
};

/// @remarks The original name for this struct in RGFW is `RGFW_windowFlags`. This was originally
///          an enum but has been converted to a packed struct for a better Zig developer
///          experience.
pub const RgfwWindowFlags = packed struct(u32) {
    /// @brief The window doesn't have a border.
    ///
    /// @remarks The original name for this type in RGFW is `RGFW_windowNoBorder`.
    rgfw_window_no_border: bool = false,
    /// @brief The window cannot be resized by the user.
    ///
    /// @remarks The original name for this type in RGFW is `RGFW_windowNoResize`.
    rgfw_window_no_resize: bool = false,
    /// @brief The window supports drag and drop.
    ///
    /// @remarks The original name for this type in RGFW is ``RGFW_windowAllowDND.
    rgfw_window_allow_dnd: bool = false,
    /// @brief The window should hide the mouse (can be toggled later on using
    ///        `rgfwWindowShowMouse`).
    ///
    /// @remarks The original name for this type in RGFW is `RGFW_windowHideMouse`.
    rgfw_window_hide_mouse: bool = false,
    /// @brief The window is fullscreen by default.
    ///
    /// @remarks The original name for this type in RGFW is `RGFW_windowFullscreen`.
    rgfw_window_fullscreen: bool = false,
    /// @brief The window is transparent (only properly works on X11 and MacOS, although it's
    ///        meant for for windows).
    ///
    /// @remarks The original name for this type in RGFW is `RGFW_windowTransparent`.
    rgfw_window_transparent: bool = false,
    /// @brief Center the window on the screen.
    ///
    /// @remarks The original name for this type in RGFW is `RGFW_windowCenter`.
    rgfw_window_center: bool = false,
    _reserved_bit_7: u1 = 0,
    /// @brief Scale the window to the screen.
    ///
    /// @remarks The original name for this type in RGFW is `RGFW_windowScaleToMonitor`.
    rgfw_window_scale_to_monitor: bool = false,
    /// @brief The window is hidden.
    ///
    /// @remarks The original name for this type in RGFW is `RGFW_windowHide`.
    rgfw_window_hide: bool = false,
    /// @brief No brief description was provided by RGFW.
    ///
    /// @remarks The original name for this type in RGFW is `RGFW_windowMaximize`.
    rgfw_window_maximize: bool = false,
    /// @brief No brief description was provided by RGFW.
    ///
    /// @remarks The original name for this type in RGFW is `RGFW_windowCenterCursor`.
    rgfw_window_center_cursor: bool = false,
    /// @brief Create a floating window.
    ///
    /// @remarks The original name for this type in RGFW is `RGFW_windowFloating`.
    rgfw_window_floating: bool = false,
    /// @brief Focus the window when it's shown.
    ///
    /// @remarks The original name for this type in RGFW is `RGFW_windowFocusOnShow`.
    rgfw_window_focus_on_show: bool = false,
    /// @brief No brief description was provided by RGFW.
    ///
    /// @remarks The original name for this type in RGFW is ``RGFW_windowMinimize.
    rgfw_window_minimize: bool = false,
    /// @brief If the window is in focus.
    ///
    /// @remarks The original name for this type in RGFW is `RGFW_windowFocus`.
    rgfw_window_focus: bool = false,
    _reserved_bit_16: u1 = 0,
    /// @brief Create an OpenGL context (you can also do this manually with
    ///        `rgfwWindowCreateContextOpenGl).
    ///
    /// @remarks The original name for this type in RGFW is `RGFW_windowOpenGL`.
    rgfw_window_open_gl: bool = false,
    /// @brief Create an EGL context (you can also do this manually with
    ///        `rgfwWindowCreateContextEgl`).
    ///
    /// @remarks The original name for this type in RGFW is ``RGFW_windowEGL.
    rgfw_window_egl: bool = false,
    _: u13 = 0,
};

// MARK: Structs

/// @brief Basic area type, if there's not already an area type of choice.
pub const RgfwArea = extern struct {
    w: u32,
    h: u32,
};

/// @brief No brief description was provided by RGFW.
///
/// @remarks The original name for this struct in RGFW is `RGFW_commonEvent`.
const RgfwCommonEvent = extern struct {
    /// @brief Which event has been sent.
    ///
    /// @remarks The original name for this member in RGFW is `type`, which is reserved in Zig.
    event_type: RgfwEventType,
    /// @brief The window this event applies too (for event queue events).
    win: *RgfwWindow,
};

/// @brief No brief description was provided by RGFW.
///
/// @remarks The original name for this struct in RGFW is `RGFW_dataDragEvent`.
const RgfwDataDragEvent = extern struct {
    /// @brief Which event has been sent.
    ///
    /// @remarks The original name for this member in RGFW is `type`, which is reserved in Zig.
    event_type: RgfwEventType,
    /// @brief The window this event applies too (for event queue events).
    win: *RgfwWindow,
    /// @brief Mouse x of event (or drop point).
    x: i32,
    /// @brief Mouse y of event (or drop point).
    y: i32,
};

/// @brief No brief description was provided by RGFW.
///
/// @remarks The original name for this struct in RGFW is `RGFW_dataDropEvent`.
const RgfwDataDropEvent = extern struct {
    /// @brief Which event has been sent.
    ///
    /// @remarks The original name for this member in RGFW is `type`, which is reserved in Zig.
    event_type: RgfwEventType,
    /// @brief The window this event applies too (for event queue events).
    win: *RgfwWindow,
    /// @brief Dropped files.
    files: [260][*:0]const u8,
    /// @brief How many files were dropped.
    count: usize,
};

/// @brief No brief description was provided by RGFW.
///
/// @remarks The original name for this struct in RGFW is `RGFW_keyEvent`.
const RgfwKeyEvent = extern struct {
    /// @brief Which event has been sent.
    ///
    /// @remarks The original name for this member in RGFW is `type`, which is reserved in Zig.
    event_type: RgfwEventType,
    /// @brief The window this event applies too (for event queue events).
    win: *RgfwWindow,
    /// @brief Mouse x of event (or drop point).
    x: i32,
    /// @brief Mouse y of event (or drop point).
    y: i32,
    /// @brief Raw mouse movement x.
    ///
    /// @remarks The original name for this member in RGFW is `vecY`.
    vec_x: i32,
    /// @brief Raw mouse movement y.
    ///
    /// @remarks The original name for this member in RGFW is `vecY`.
    vec_y: i32,
};

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

/// @brief No brief description was provided by RGFW.
///
/// @remarks The original name for this struct in RGFW is `RGFW_mouseButtonEvent`.
const RgfwMouseButtonEvent = extern struct {
    /// @brief Which event has been sent.
    ///
    /// @remarks The original name for this member in RGFW is `type`, which is reserved in Zig.
    event_type: RgfwEventType,
    /// @brief The window this event applies too (for event queue events).
    win: *RgfwWindow,
    /// @brief Which mouse button was pressed.
    value: u8,
};

/// @brief No brief description was provided by RGFW.
///
/// @remarks The original name for this struct in RGFW is `RGFW_mousePosEvent`.
const RgfwMousePosEvent = extern struct {
    /// @brief Which event has been sent.
    ///
    /// @remarks The original name for this member in RGFW is `type`, which is reserved in Zig.
    event_type: RgfwEventType,
    /// @brief The window this event applies too (for event queue events).
    win: *RgfwWindow,
    /// @brief Mouse x of event (or drop point).
    x: i32,
    /// @brief Mouse y of event (or drop point).
    y: i32,
    /// @brief Raw mouse movement x.
    ///
    /// @remarks The original name for this member in RGFW is `vecY`.
    vec_x: i32,
    /// @brief Raw mouse movement y.
    ///
    /// @remarks The original name for this member in RGFW is `vecY`.
    vec_y: i32,
};

/// @brief No brief description was provided by RGFW.
///
/// @remarks The original name for this struct in RGFW is `RGFW_mouseScrollEvent`.
const RgfwMouseScrollEvent = extern struct {
    /// @brief Which event has been sent.
    ///
    /// @remarks The original name for this member in RGFW is `type`, which is reserved in Zig.
    event_type: RgfwEventType,
    /// @brief The window this event applies too (for event queue events).
    win: *RgfwWindow,
    /// @brief The raw mouse scroll x value.
    x: f32,
    /// @brief The raw mouse scroll y value.
    y: f32,
};

/// @brief No brief description was provided by RGFW.
///
/// @remarks The original name for this struct in RGFW is `RGFW_nativeImage`.
///
/// @todo This currently doesn't support Wayland for linux devices, we should fix that at some
///       point, but that's also out of scope for Manatee at this time so 🤷
pub const RgfwNativeImage = switch (builtin.os.tag) {
    .macos => extern struct {
        /// @brief No brief description was provided by RGFW.
        format: RgfwFormat,
    },
    .linux => extern struct {
        /// @brief No brief description was provided by RGFW.
        bitmap: *anyopaque,
    },
    .wasi => extern struct {
        /// @brief No brief description was provided by RGFW.
        format: RgfwFormat,
    },
    .windows => extern struct {
        /// @brief No brief description was provided by RGFW.
        bitmap: *anyopaque,
        /// @brief No brief description was provided by RGFW.
        ///
        /// @remarks The original name for this member in RGFW is `bitmapBits`.
        bitmap_bits: *u8,
        /// @brief No brief description was provided by RGFW.
        format: *RgfwFormat,
        /// @brief No brief description was provided by RGFW.
        ///
        /// @remarks The original name for this member in RGFW is `hdcMem`.
        hdc_mem: *anyopaque,
    },
    else => unreachable,
};

/// @brief Basic vector type, if there's not already a point/vector type of choice.
///
/// @remarks The original name for this struct in RGFW is `RGFW_point`.
pub const RgfwPoint = extern struct {
    /// @brief No brief description was provided by RGFW.
    x: i32,
    /// @brief No brief description was provided by RGFW.
    y: i32,
};

/// @brief Basic rect type, if there's not already a rect type of choice.
///
/// @remarks The original name for this struct in RGFW is `RGFW_rect`.
pub const RgfwRect = extern struct {
    /// @brief No brief description was provided by RGFW.
    x: i32,
    /// @brief No brief description was provided by RGFW.
    y: i32,
    /// @brief No brief description was provided by RGFW.
    w: i32,
    /// @brief No brief description was provided by RGFW.
    h: i32,
};

/// @brief No brief description was provided by RGFW.
///
/// @remarks The original name for this struct in RGFW is `RGFW_scaleUpdatedEvent`.
const RgfwScaleUpdatedEvent = extern struct {
    /// @brief Which event has been sent.
    ///
    /// @remarks The original name for this member in RGFW is `type`, which is reserved in Zig.
    event_type: RgfwEventType,
    /// @brief The window this event applies too (for event queue events).
    win: *RgfwWindow,
    /// @brief DPI scaling x.
    x: f32,
    /// @brief DPI scaling y.
    y: f32,
};

/// @brief No brief description was provided by RGFW.
///
/// @remarks The original name for this struct in RGFW is `RGFW_surface`.
pub const RgfwSurface = extern struct {
    /// @brief No brief description was provided by RGFW.
    data: *u8,
    /// @brief No brief description was provided by RGFW.
    w: i32,
    /// @brief No brief description was provided by RGFW.
    h: i32,
    /// @brief No brief description was provided by RGFW.
    format: RgfwFormat,
    /// @brief No brief description was provided by RGFW.
    native: RgfwNativeImage,
};

/// @brief Window structure for the window.
pub const RgfwWindow = extern struct {
    /// @brief Src window data.
    source: RgfwWindowSrc,
    /// @brief Ptr for usr data.
    user_ptr: *anyopaque,
    /// @brief Position and size of the window.
    r: RgfwRect,
    /// @brief Which key `rgfwWindowShouldClose` checks. Setting this to `rgfw_key_null` disables.
    /// the feature.
    exit_key: RgfwKey,
    /// @brief Last cursor point (for raw mouse data).
    _last_mouse_point: RgfwPoint,
    /// @brief No brief description was provided by RGFW.
    _key_mod: RgfwKeyMod,
    /// @brief Windows flags (for RGFW to check)
    _flags: RgfwWindowFlags,
    /// @brief Rect before fullscreen
    _old_rect: RgfwRect,
};

/// @brief Src window data
///
/// @remarks The original name for this struct in RGFW is `RGFW_window_src`.
///
/// @todo This currently doesn't support Wayland for linux devices, we should fix that at some
///       point, but that's also out of scope for Manatee at this time so 🤷
pub const RgfwWindowSrc = switch (builtin.os.tag) {
    .macos => extern struct {
        /// @brief No brief description was provided by RGFW.
        window: *anyopaque,
        /// @brief Apple viewpoint thingy
        view: *anyopaque,
        /// @brief No brief description was provided by RGFW.
        mouse: *anyopaque,
    },
    .linux => extern struct {
        // @brief No brief description was provided by RGFW.
        window: *anyopaque,
        // @brief No brief description was provided by RGFW.
        gc: *anyopaque,
    },
    .wasi => extern struct {},
    .windows => extern struct {
        /// @brief Source window.
        window: *anyopaque,
        /// @brief Source HDC.
        hdc: *anyopaque,
        /// @brief Width offset for window.
        ///
        /// @remarks The original name for this member in RGFW is `offsetW`.
        offset_w: i32,
        /// @brief Width offset for window.
        ///
        /// @remarks The original name for this member in RGFW is `offsetH`.
        offset_h: i32,
        /// @brief Source window icon (small).
        ///
        /// @remarks The original name for this member in RGFW is `hIconSmall`.
        h_icon_small: *anyopaque,
        /// @brief Source window icon (big).
        ///
        /// @remarks The original name for this member in RGFW is `hIconBig`.
        h_icon_big: *anyopaque,
        /// @brief For setting max resize width.
        ///
        /// @remarks The original name for this member in RGFW is `maxSizeW`.
        max_size_w: i32,
        /// @brief For setting max resize height.
        ///
        /// @remarks The original name for this member in RGFW is `maxSizeH`.
        max_size_h: i32,
        /// @brief For setting min resize width.
        ///
        /// @remarks The original name for this member in RGFW is `minSizeW`.
        min_size_w: i32,
        /// @brief For setting min resize height.
        ///
        /// @remarks The original name for this member in RGFW is `minSizeH`.
        min_size_h: i32,
        /// @brief No brief description was provided by RGFW.
        ///
        /// @remarks The original name for this member in RGFW is `aspectRatioW`.
        aspect_ratio_w: i32,
        /// @brief No brief description was provided by RGFW.
        ///
        /// @remarks The original name for this member in RGFW is `aspectRatioH`.
        aspect_ratio_h: i32,
    },
    else => unreachable,
};

// MARK: Unions

/// @brief Event structure for checking/getting events.
///
/// @remarks The original name for this struct in RGFW is `RGFW_event`.
pub const RgfwEvent = extern union {
    /// @brief Which event has been sent?
    ///
    /// @remarks The original name for this member in RGFW is `type`, which is reserved in Zig.
    event_type: RgfwEventType,
    /// @brief Common event data (e.g.) type and win.
    common: RgfwCommonEvent,
    /// @brief Data for a button press/release.
    button: RgfwMouseButtonEvent,
    /// @brief Data for a mouse scroll.
    scroll: RgfwMouseScrollEvent,
    /// @brief Data for mouse motion events.
    mouse: RgfwMousePosEvent,
    /// @brief Data for key press/release/hold events.
    key: RgfwKeyEvent,
    /// @brief Dropping a file events.
    drop: RgfwDataDropEvent,
    /// @brief Data for dragging a file events.
    drag: RgfwDataDragEvent,
    /// @brief Data for monitor scaling events.
    scale: RgfwScaleUpdatedEvent,
};

// MARK: C Functions

extern "rgfw" fn RGFW_alloc(size: usize) callconv(.c) *anyopaque;
extern "rgfw" fn RGFW_copyImageData(dest_data: *u8, w: i32, h: i32, dest_format: RgfwFormat, src_data: *u8, src_format: RgfwFormat) callconv(.c) void;
extern "rgfw" fn RGFW_createSurface(data: *u8, w: i32, h: i32, format: RgfwFormat) callconv(.c) *RgfwSurface;
extern "rgfw" fn RGFW_createSurfacePtr(data: *u8, w: i32, h: i32, format: RgfwFormat, surface: *RgfwSurface) callconv(.c) bool;
extern "rgfw" fn RGFW_createWindow(name: [*c]const u8, x: i32, y: i32, w: i32, h: i32, flags: u32) callconv(.c) *RgfwWindow;
extern "rgfw" fn RGFW_createWindowPtr(name: [*c]const u8, x: i32, y: i32, w: i32, h: i32, flags: u32, win: *RgfwWindow) callconv(.c) *RgfwWindow;
extern "rgfw" fn RGFW_free(ptr: *anyopaque) callconv(.c) void;
extern "rgfw" fn RGFW_freeMouse(mouse: *RgfwMouse) callconv(.c) void;
extern "rgfw" fn RGFW_getDisplay_Wayland() callconv(.c) *anyopaque;
extern "rgfw" fn RGFW_getDisplay_X11() callconv(.c) *anyopaque;
extern "rgfw" fn RGFW_getLayer_OSX() callconv(.c) *anyopaque;
extern "rgfw" fn RGFW_getMonitors(len: *usize) callconv(.c) *[]RgfwMonitor;
extern "rgfw" fn RGFW_getPrimaryMonitor() callconv(.c) RgfwMonitor;
extern "rgfw" fn RGFW_loadMouse(data: *u8, w: i32, h: i32, format: RgfwFormat) callconv(.c) *RgfwMouse;
extern "rgfw" fn RGFW_monitorModeCompare(mon: RgfwMonitor, mon2: RgfwMonitor, request: RgfwModeRequest) callconv(.c) bool;
extern "rgfw" fn RGFW_monitor_scaleToWindow(mon: RgfwMonitor, win: *RgfwWindow) callconv(.c) bool;
extern "rgfw" fn RGFW_monitor_requestMode(mon: RgfwMonitor, mon2: RgfwMonitor, request: RgfwModeRequest) callconv(.c) bool;
extern "rgfw" fn RGFW_pollEvents() callconv(.c) void;
extern "rgfw" fn RGFW_moveToMacOSResourceDir() callconv(.c) void;
extern "rgfw" fn RGFW_setClassName(name: [*c]const u8) callconv(.c) void;
extern "rgfw" fn RGFW_setQueueEvents(queue: bool) callconv(.c) void;
extern "rgfw" fn RGFW_setXInstName(name: [*c]const u8) callconv(.c) void;
extern "rgfw" fn RGFW_sizeofNativeImage() callconv(.c) usize;
extern "rgfw" fn RGFW_sizeofSurface() callconv(.c) usize;
extern "rgfw" fn RGFW_sizeofWindow() callconv(.c) usize;
extern "rgfw" fn RGFW_sizeofWindowSrc() callconv(.c) usize;
extern "rgfw" fn RGFW_stopCheckEvents() callconv(.c) void;
extern "rgfw" fn RGFW_surface_free(surface: *RgfwSurface) callconv(.c) void;
extern "rgfw" fn RGFW_surface_freePtr(surface: *RgfwSurface) callconv(.c) void;
extern "rgfw" fn RGFW_surface_getNativeImage(surface: *RgfwSurface) callconv(.c) *RgfwNativeImage;
extern "rgfw" fn RGFW_useWayland(wayland: bool) callconv(.c) void;
extern "rgfw" fn RGFW_usingWayland() callconv(.c) bool;
extern "rgfw" fn RGFW_waitForEvent(wait_ms: i32) callconv(.c) void;
extern "rgfw" fn RGFW_window_blitSurface(win: *RgfwWindow, surface: *RgfwSurface) callconv(.c) void;
extern "rgfw" fn RGFW_window_createSurface(win: *RgfwWindow, data: *u8, w: i32, h: i32, format: RgfwFormat) callconv(.c) *RgfwSurface;
extern "rgfw" fn RGFW_window_createSurfacePtr(win: *RgfwWindow, data: *u8, w: i32, h: i32, format: RgfwFormat, surface: *RgfwSurface) callconv(.c) bool;
extern "rgfw" fn RGFW_window_getEnabledEvents(win: *RgfwWindow) callconv(.c) u32;
extern "rgfw" fn RGFW_window_getExitKey(win: *RgfwWindow) callconv(.c) RgfwKey;
extern "rgfw" fn RGFW_window_getFlags(win: *RgfwWindow) callconv(.c) u32;
extern "rgfw" fn RGFW_window_getHDC(win: *RgfwWindow) callconv(.c) ?*anyopaque;
extern "rgfw" fn RGFW_window_getHWND(win: *RgfwWindow) callconv(.c) ?*anyopaque;
extern "rgfw" fn RGFW_window_getPosition(win: *RgfwWindow, x: *i32, y: *i32) callconv(.c) bool;
extern "rgfw" fn RGFW_window_getSize(win: *RgfwWindow, x: *i32, y: *i32) callconv(.c) bool;
extern "rgfw" fn RGFW_window_getSrc(win: *RgfwWindow) callconv(.c) *RgfwWindowSrc;
extern "rgfw" fn RGFW_window_getUserPtr(win: *RgfwWindow) callconv(.c) *anyopaque;
extern "rgfw" fn RGFW_window_getView_OSX(win: *RgfwWindow) callconv(.c) ?*anyopaque;
extern "rgfw" fn RGFW_window_getWindow_OSX(win: *RgfwWindow) callconv(.c) ?*anyopaque;
extern "rgfw" fn RGFW_window_getWindow_Wayland(win: *RgfwWindow) callconv(.c) ?*anyopaque;
extern "rgfw" fn RGFW_window_getWindow_X11(win: *RgfwWindow) callconv(.c) ?u64;
extern "rgfw" fn RGFW_window_setDisabledEvents(win: *RgfwWindow, events: u32) callconv(.c) void;
extern "rgfw" fn RGFW_window_setEnabledEvents(win: *RgfwWindow, events: u32) callconv(.c) void;
extern "rgfw" fn RGFW_window_setEventState(win: *RgfwWindow, event: u32, state: bool) callconv(.c) void;
extern "rgfw" fn RGFW_window_setExitKey(win: *RgfwWindow, key: RgfwKey) callconv(.c) void;
extern "rgfw" fn RGFW_window_setLayerOsx(win: *RgfwWindow, layer: *anyopaque) callconv(.c) void;
extern "rgfw" fn RGFW_window_setUserPtr(win: *RgfwWindow, ptr: *anyopaque) callconv(.c) void;
