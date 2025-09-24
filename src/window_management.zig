const monitor = @import("monitor.zig");
const rgfw = @import("rgfw.zig");

const RgfwMonitor = monitor.RgfwMonitor;
const RgfwArea = rgfw.RgfwArea;
const RgfwEvent = rgfw.RgfwEvent;
const RgfwFormat = rgfw.RgfwFormat;
const RgfwKey = rgfw.RgfwKey;
const RgfwMouse = rgfw.RgfwMouse;
const RgfwMouseButton = rgfw.RgfwMouseButton;
const RgfwPoint = rgfw.RgfwPoint;
const RgfwRect = rgfw.RgfwRect;
const RgfwWindow = rgfw.RgfwWindow;
const RgfwWindowFlags = rgfw.RgfwWindowFlags;

// MARK: Enums

/// No brief description was provided by RGFW.
///
/// @remarks The original name for this enum in RGFW is `RGFW_mouseIcons`.
pub const RgfwMouseIcons = enum(u8) {
    /// No brief description was provided by RGFW.
    ///
    /// @remarks The original name for this constant in RGFW is `RGFW_mouseNormal`.
    rgfw_mouse_normal = 0,
    /// No brief description was provided by RGFW.
    ///
    /// @remarks The original name for this constant in RGFW is `RGFW_mouseArrow`.
    rgfw_mouse_arrow = 1,
    /// No brief description was provided by RGFW.
    ///
    /// @remarks The original name for this constant in RGFW is `RGFW_mouseIbeam`.
    rgfw_mouse_i_beam = 2,
    /// No brief description was provided by RGFW.
    ///
    /// @remarks The original name for this constant in RGFW is `RGFW_mouseCrosshair`.
    rgfw_mouse_crosshair = 3,
    /// No brief description was provided by RGFW.
    ///
    /// @remarks The original name for this constant in RGFW is `RGFW_mousePointingHand`.
    rgfw_mouse_pointing_hand = 4,
    /// No brief description was provided by RGFW.
    ///
    /// @remarks The original name for this constant in RGFW is `RGFW_mouseResizeEW`.
    rgfw_mouse_resize_e_w = 5,
    /// No brief description was provided by RGFW.
    ///
    /// @remarks The original name for this constant in RGFW is `RGFW_mouseResizeNS`.
    rgfw_mouse_resize_n_s = 6,
    /// No brief description was provided by RGFW.
    ///
    /// @remarks The original name for this constant in RGFW is `RGFW_mouseResizeNWSE`.
    rgfw_mouse_resize_n_w_s_e = 7,
    /// No brief description was provided by RGFW.
    ///
    /// @remarks The original name for this constant in RGFW is `RGFW_mouseResizeNESW`.
    rgfw_mouse_resize_n_e_s_w = 8,
    /// No brief description was provided by RGFW.
    ///
    /// @remarks The original name for this constant in RGFW is `RGFW_mouseResizeAll`.
    rgfw_mouse_resize_all = 9,
    /// No brief description was provided by RGFW.
    ///
    /// @remarks The original name for this constant in RGFW is `RGFW_mouseNotAllowed`.
    rgfw_mouse_not_allowed = 10,
    /// No brief description was provided by RGFW.
    ///
    /// @remarks The original name for this constant in RGFW is `RGFW_mouseIconCount`.
    rgfw_mouse_icon_count = 11,
    /// Padding for alignment.
    ///
    /// @remarks The original name for this constant in RGFW is `RGFW_mouseIconFinal`.
    rgfw_mouse_icon_final = 16,
};

// MARK: Packed Structs

/// @brief No brief description was provided by RGFW.
///
/// @remarks The original name for this struct in RGFW is `RGFW_Icon`. This was originally an enum
///          but has been converted to a packed struct for a better Zig developer experience. The
///          original property `RGFW_iconBoth` is missing, however it can be used by setting both
///          members to `true`. For example:
///
///          ```zig
///          const rgfw_icon_both = RgfwIcon{
///            .rgfw_icon_taskbar = true,
///            .rgfw_icon_window = true,
///          };
///          ```
pub const RgfwIcon = packed struct(u8) {
    /// @brief No brief description was provided by RGFW.
    ///
    /// @remarks The original name for this member in RGFW is `RGFW_iconTaskbar`.
    rgfw_icon_taskbar: bool = false,
    /// @brief No brief description was provided by RGFW.
    ///
    /// @remarks The original name for this member in RGFW is `RGFW_iconWindow`.
    rgfw_icon_window: bool = false,
    _: u6 = 0,
};

// MARK: Functions

/// @brief Where the mouse is on the screen.
///
/// @remarks The original name for this function in RGFW is `RGFW_getGlobalMouse`.
pub fn rgfwGetGlobalMouse(x: *i32, y: *i32) bool {
    return RGFW_getGlobalMouse(x, y);
}

/// @brief Check if DND is allowed.
///
/// @remarks The original name for this function in RGFW is `RGFW_window_allowsDND`.
pub fn rgfwWindowAllowsDnd(win: *RgfwWindow) bool {
    return RGFW_window_allowsDND(win);
}

/// @brief No brief description was provided by RGFW.
///
/// @remarks The original name for this function in RGFW is `RGFW_window_borderless`.
pub fn rgfwWindowBorderless(win: *RgfwWindow) bool {
    return RGFW_window_borderless(win);
}

/// @brief Center the window.
///
/// @remarks The original name for this function in RGFW is `RGFW_window_center`.
pub fn rgfwWindowCenter(win: *RgfwWindow) void {
    return RGFW_window_center(win);
}

/// @brief Polls the event queue if it's empty and pops the first event for the window from the
///        event queue
///
/// @warning Using this function without a while loop may cause event lag.
///
/// @details Because this function polls events, it may not work for multi-threaded systems.
///          `rgfwPollEvents` + `rgfwWindowCheckQueuedEvent` should be used when using
///          multi-threaded systems. You may also use `rgfwPollEvents` instead.
///
/// @remarks The original name for this function in RGFW is `RGFW_window_checkEvent`.
pub fn rgfwWindowCheckEvent(win: *RgfwWindow, event: *RgfwEvent) bool {
    return RGFW_window_checkEvent(win, event);
}

/// @brief Pops the first event for the window from the event queue.
///
/// @remarks The original name for this function in RGFW is `RGFW_window_checkQueuedEvent`.
pub fn rgfwWindowCheckQueuedEvent(win: *RgfwWindow, event: *RgfwEvent) bool {
    return RGFW_window_checkQueuedEvent(win, event);
}

/// @brief Close the window and free the window struct.
///
/// @remarks The original name for this function in RGFW is `RGFW_window_close`.
pub fn rgfwWindowClose(win: *RgfwWindow) void {
    return RGFW_window_close(win);
}

/// @brief Close the window, don't free the window struct.
///
/// @remarks The original name for this function in RGFW is `RGFW_window_closePtr`.
pub fn rgfwWindowClosePtr(win: *RgfwWindow) void {
    return RGFW_window_closePtr(win);
}

/// @brief True the first frame there was a data drop (drag and drop) to the window.
///
/// @remarks The original name for this function in RGFW is `RGFW_window_didDataDrop`.
pub fn rgfwWindowDidDataDrop(win: *RgfwWindow) bool {
    return RGFW_window_didDataDrop(win);
}

/// @brief If the mouse enter the window, only true for the first frame.
///
/// @remarks The original name for this function in RGFW is `RGFW_window_didMouseEnter`.
pub fn rgfwWindowDidMouseEnter(win: *RgfwWindow) bool {
    return RGFW_window_didMouseEnter(win);
}

/// @brief If the mouse left the window, only true for the first frame.
///
/// @remarks The original name for this function in RGFW is `RGFW_window_didMouseLeave`.
pub fn rgfwWindowDidMouseLeave(win: *RgfwWindow) bool {
    return RGFW_window_didMouseLeave(win);
}

/// @brief Sets the focus to this window.
///
/// @remarks The original name for this function in RGFW is `RGFW_window_focus`.
pub fn rgfwWindowFocus(win: *RgfwWindow) void {
    return RGFW_window_focus(win);
}

/// @brief Gets the drag point, returns true if if there is data being dragged to/in the window,
///        only true for the first frame.
///
/// @remarks The original name for this function in RGFW is `RGFW_window_getDataDrag`.
pub fn rgfwWindowGetDataDrag(win: *RgfwWindow, x: *i32, y: *i32) bool {
    return RGFW_window_getDataDrag(win, x, y);
}

/// @brief Sets file pointer to the internal files pointer, fills count with the number of files,
///        true the first frame there was a data drop (drag and drop) to the window.
///
/// @remarks The original name for this function in RGFW is `RGFW_window_getDataDrop`.
pub fn rgfwWindowGetDataDrop(win: *RgfwWindow, files: *[][*:0]const u8, count: *usize) bool {
    return RGFW_window_getDataDrop(win, files, count);
}

/// @brief Where the mouse is on the window.
///
/// @remarks The original name for this function in RGFW is `RGFW_window_getMouse`.
pub fn rgfwWindowGetMouse(win: *RgfwWindow, x: *i32, y: *i32) bool {
    return RGFW_window_getMouse(win, x, y);
}

/// @brief hide the window
///
/// @remarks The original name for this function in RGFW is `RGFW_window_hide`.
pub fn rgfwWindowHide(win: *RgfwWindow) void {
    return RGFW_window_hide(win);
}

/// @brief No brief description was provided by RGFW.
///
/// @remarks The original name for this function in RGFW is `RGFW_window_holdMouse`.
pub fn rgfwWindowHoldMouse(win: *RgfwWindow, area: RgfwArea) void {
    return RGFW_window_holdMouse(win, area);
}

/// @brief If there is data being dragged to/in the window, only true for the first frame.
///
/// @remarks The original name for this function in RGFW is `RGFW_window_isDataDragging`.
pub fn rgfwWindowIsDataDragging(win: *RgfwWindow) bool {
    return RGFW_window_isDataDragging(win);
}

/// @brief If the window is floating.
///
/// @remarks The original name for this function in RGFW is `RGFW_window_isFloating`.
pub fn rgfwWindowIsFloating(win: *RgfwWindow) bool {
    return RGFW_window_isFloating(win);
}

/// @brief If the window is fullscreen.
///
/// @remarks The original name for this function in RGFW is `RGFW_window_isFullscreen`.
pub fn rgfwWindowIsFullscreen(win: *RgfwWindow) bool {
    return RGFW_window_isFullscreen(win);
}

/// @brief If the window is hidden
///
/// @remarks The original name for this function in RGFW is `RGFW_window_isHidden`.
pub fn rgfwWindowIsHidden(win: *RgfwWindow) bool {
    return RGFW_window_isHidden(win);
}

/// @brief If the mouse is held by RGFW.
///
/// @remarks The original name for this function in RGFW is `RGFW_window_isHoldingMouse`.
pub fn rgfwWindowIsHoldingMouse(win: *RgfwWindow) bool {
    return RGFW_window_isHoldingMouse(win);
}

/// @brief Checks the focus to this window
///
/// @remarks The original name for this function in RGFW is `RGFW_window_isInFocus`.
pub fn rgfwWindowIsInFocus(win: *RgfwWindow) bool {
    return RGFW_window_isInFocus(win);
}

/// @brief If key is held (key code).
///
/// @remarks The original name for this function in RGFW is `RGFW_window_isKeyDown`.
pub fn rgfwWindowIsKeyDown(win: *RgfwWindow, key: RgfwKey) bool {
    return RGFW_window_isKeyDown(win, key);
}

/// @brief If key is pressed (key code).
///
/// @remarks The original name for this function in RGFW is `RGFW_window_isKeyPressed`.
pub fn rgfwWindowIsKeyPressed(win: *RgfwWindow, key: RgfwKey) bool {
    return RGFW_window_isKeyPressed(win, key);
}

/// @brief If key is released (key code).
///
/// @remarks The original name for this function in RGFW is `RGFW_window_isKeyReleased`.
pub fn rgfwWindowIsKeyReleased(win: *RgfwWindow, key: RgfwKey) bool {
    return RGFW_window_isKeyReleased(win, key);
}

/// @brief If the window is maximized
///
/// @remarks The original name for this function in RGFW is `RGFW_window_isMaximized`.
pub fn rgfwWindowIsMaximized(win: *RgfwWindow) bool {
    return RGFW_window_isMaximized(win);
}

/// @brief If the window is minimized.
///
/// @remarks The original name for this function in RGFW is `RGFW_window_isMinimized`.
pub fn rgfwWindowIsMinimized(win: *RgfwWindow) bool {
    return RGFW_window_isMinimized(win);
}

/// @brief If a mouse button is down.
///
/// @remarks The original name for this function in RGFW is RGFW_window_isMouseDown`.
pub fn rgfwWindowIsMouseDown(win: *RgfwWindow, button: RgfwMouseButton) bool {
    return RGFW_window_isMouseDown(win, button);
}

/// @brief If the mouse is within the window or not.
///
/// @remarks The original name for this function in RGFW is RGFW_window_isMouseInside`.
pub fn rgfwWindowIsMouseInside(win: *RgfwWindow) bool {
    return RGFW_window_isMouseInside(win);
}

/// @brief If a mouse button is pressed.
///
/// @remarks The original name for this function in RGFW is RGFW_window_isMousePressed`.
pub fn rgfwWindowIsMousePressed(win: *RgfwWindow, button: RgfwMouseButton) bool {
    return RGFW_window_isMousePressed(win, button);
}

/// @brief If a mouse button is released.
///
/// @remarks The original name for this function in RGFW is RGFW_window_isMouseReleased`.
pub fn rgfwWindowIsMouseReleased(win: *RgfwWindow, button: RgfwMouseButton) bool {
    return RGFW_window_isMouseReleased(win, button);
}

/// @brief If the mouse is hidden.
///
/// @remarks The original name for this function in RGFW is `RGFW_window_isMouseHidden`.
pub fn rgfwWindowIsMouseHidden(win: *RgfwWindow) bool {
    return RGFW_window_isMouseHidden(win);
}

/// @brief Maximize the window.
///
/// @remarks The original name for this function in RGFW is `RGFW_window_maximize`.
pub fn rgfwWindowMaximize(win: *RgfwWindow) void {
    return RGFW_window_maximize(win);
}

/// @brief Minimize the window (in taskbar (per OS)).
///
/// @remarks The original name for this function in RGFW is `RGFW_window_minimize`.
pub fn rgfwWindowMinimize(win: *RgfwWindow) void {
    return RGFW_window_minimize(win);
}

/// @brief Move a window to a given point.
///
/// @remarks The original name for this function in RGFW is `RGFW_window_move`.
pub fn rgfwWindowMove(win: *RgfwWindow, v: RgfwPoint) void {
    return RGFW_window_move(win, v);
}

/// @brief Move the mouse to a given point.
///
/// @remarks The original name for this function in RGFW is `RGFW_window_moveMouse`.
pub fn rgfwWindowMoveMouse(win: *RgfwWindow, v: RgfwPoint) void {
    return RGFW_window_moveMouse(win, v);
}

/// @brief Move window to a specific monitor.
///
/// @remarks The original name for this function in RGFW is `RGFW_window_moveToMonitor`.
pub fn rgfwWindowMoveToMonitor(win: *RgfwWindow, m: RgfwMonitor) void {
    return RGFW_window_moveToMonitor(win, m);
}

/// @brief Raise the window (to the top).
///
/// @remarks The original name for this function in RGFW is `RGFW_window_raise`.
pub fn rgfwWindowRaise(win: *RgfwWindow) void {
    return RGFW_window_raise(win);
}

/// @brief Resize window to a current size/area
///
/// @remarks The original name for this function in RGFW is `RGFW_window_resize`.
pub fn rgfwWindowResize(win: *RgfwWindow, a: RgfwArea) void {
    return RGFW_window_resize(win, a);
}

/// @brief Restore the window from minimized (per OS).
///
/// @remarks The original name for this function in RGFW is `RGFW_window_restore`.
pub fn rgfwWindowRestore(win: *RgfwWindow) void {
    return RGFW_window_restore(win);
}

/// @brief Set window aspect ratio.
///
/// @remarks The original name for this function in RGFW is `RGFW_window_setAspectRatio`.
pub fn rgfwWindowSetAspectRatio(win: *RgfwWindow, a: RgfwArea) void {
    return RGFW_window_setAspectRatio(win, a);
}

/// @brief If the window should have a border or not (borderless) based on bool value of border.
///
/// @remarks The original name for this function in RGFW is `RGFW_window_setBorder`.
pub fn rgfwWindowSetBorder(win: *RgfwWindow, border: bool) void {
    return RGFW_window_setBorder(win, border);
}

/// @brief Turn on / off dnd (rgfw_window_allow_dnd still must be passed to the window).
///
/// @remarks The original name for this function in RGFW is `RGFW_window_setDND`.
pub fn rgfwWindowSetDnd(win: *RgfwWindow, allow: bool) void {
    return RGFW_window_setDND(win, allow);
}

/// @brief Set the window flags (will undo flags if they don't match the old ones).
///
/// @remarks The original name for this function in RGFW is `RGFW_window_setFlags`.
pub fn rgfwWindowSetFlags(window_flags: RgfwWindowFlags) void {
    return RGFW_window_setFlags(window_flags);
}

/// @brief Make the window a floating window.
///
/// @remarks The original name for this function in RGFW is `RGFW_window_setFloating`.
pub fn rgfwWindowSetFloating(win: *RgfwWindow, floating: bool) void {
    return RGFW_window_setFloating(win, floating);
}

/// @brief Turn fullscreen on / off for a window.
///
/// @remarks The original name for this function in RGFW is `RGFW_window_setFullscreen`.
pub fn rgfwWindowSetFullscreen(win: *RgfwWindow, fullscreen: bool) void {
    return RGFW_window_setFullscreen(win, fullscreen);
}

/// @brief Image MAY be resized by default, set both the taskbar and window icon.
///
/// @remarks The original name for this function in RGFW is `RGFW_window_setIcon`.
pub fn rgfwWindowSetIcon(win: *RgfwWindow, data: *u8, w: i32, h: i32, format: RgfwFormat) bool {
    return RGFW_window_setIcon(win, data, w, h, format);
}

/// @brief Sets mouse to `rgfw_mouse` icon (loaded from a bitmap struct).
///
/// @remarks The original name for this function in RGFW is `RGFW_window_setIconEx`.
pub fn rgfwWindowSetIconEx(win: *RgfwWindow, data: *u8, w: i32, h: i32, format: RgfwFormat, icon_type: RgfwIcon) bool {
    return RGFW_window_setIconEx(win, data, w, h, format, icon_type);
}

/// @brief Set the maximum dimensions of a window
///
/// @remarks The original name for this function in RGFW is `RGFW_window_setMaxSize`.
pub fn rgfwWindowSetMaxSize(win: *RgfwWindow, a: RgfwArea) void {
    return RGFW_window_setMaxSize(win, a);
}

/// @brief Set the minimum dimensions of a window
///
/// @remarks The original name for this function in RGFW is `RGFW_window_setMinSize`.
pub fn rgfwWindowSetMinSize(win: *RgfwWindow, a: RgfwArea) void {
    return RGFW_window_setMinSize(win, a);
}

/// @brief No brief description was provided by RGFW.
///
/// @remarks The original name for this function in RGFW is `RGFW_window_setMouse`.
pub fn rgfwWindowSetMouse(win: *RgfwWindow, mouse: *RgfwMouse) void {
    return RGFW_window_setMouse(win, mouse);
}

/// @brief Sets the mouse to the default mouse icon.
///
/// @remarks The original name for this function in RGFW is `RGFW_window_setMouseDefault`.
pub fn rgfwWindowSetMouseDefault(win: *RgfwWindow) void {
    return RGFW_window_setMouseDefault(win);
}

/// @brief Sets the mouse to a standard API cursor (based on `rgfw_mouse`)
///
/// @remarks The original name for this function in RGFW is `RGFW_window_setMouseStandard`.
pub fn rgfwWindowSetMouseStandard(win: *RgfwWindow, mouse: RgfwMouseIcons) void {
    return RGFW_window_setMouseStandard(win, mouse);
}

/// @brief Turn on / off mouse passthrough.
///
/// @remarks The original name for this function in RGFW is `RGFW_window_setMousePassthrough`.
pub fn rgfwWindowSetMousePassthrough(win: *RgfwWindow, passthrough: bool) void {
    return RGFW_window_setMousePassthrough(win, passthrough);
}

/// @brief Rename window to a given string.
///
/// @remarks The original name for this function in RGFW is `RGFW_window_setName`.
pub fn rgfwWindowSetName(win: *RgfwWindow, name: []const u8) void {
    return RGFW_window_setName(win, name.*);
}

/// @brief Sets the opacity of a window.
///
/// @remarks The original name for this function in RGFW is `RGFW_window_setOpacity`.
pub fn rgfwWindowSetOpacity(win: *RgfwWindow, opacity: u8) void {
    return RGFW_window_setOpacity(win, opacity);
}

/// @brief No brief description was provided by RGFW.
///
/// @remarks The original name for this function in RGFW is `RGFW_window_setShouldClose`.
pub fn rgfwWindowSetShouldClose(win: *RgfwWindow, should_close: bool) void {
    return RGFW_window_setShouldClose(win, should_close);
}

/// @brief If the window should close (`RgfwClose` was sent or escape was pressed) .
///
/// @remarks The original name for this function in RGFW is `RGFW_window_shouldClose`.
pub fn rgfwWindowShouldClose(win: *RgfwWindow) bool {
    return RGFW_window_shouldClose(win);
}

/// @brief Show the window.
///
/// @remarks The original name for this function in RGFW is `RGFW_window_show`.
pub fn rgfwWindowShow(win: *RgfwWindow) void {
    return RGFW_window_show(win);
}

/// @brief Show the mouse or hide the mouse.
///
/// @remarks The original name for this function in RGFW is `RGFW_window_showMouse`.
pub fn rgfwWindowShowMouse(win: *RgfwWindow, show: bool) void {
    return RGFW_window_showMouse(win, show);
}

/// @brief Stop holding the mouse and let it move freely.
///
/// @remarks The original name for this function in RGFW is `RGFW_window_unholdMouse`.
pub fn rgfwWindowUnholdMouse(win: *RgfwWindow) void {
    return RGFW_window_unholdMouse(win);
}

// MARK: C Functions

extern "rgfw" fn RGFW_getGlobalMouse(x: *i32, y: *i32) callconv(.c) bool;
extern "rgfw" fn RGFW_window_allowsDND(win: *RgfwWindow) callconv(.c) bool;
extern "rgfw" fn RGFW_window_borderless(win: *RgfwWindow) callconv(.c) bool;
extern "rgfw" fn RGFW_window_center(win: *RgfwWindow) callconv(.c) void;
extern "rgfw" fn RGFW_window_checkEvent(win: *RgfwWindow, event: *RgfwEvent) callconv(.c) bool;
extern "rgfw" fn RGFW_window_checkQueuedEvent(win: *RgfwWindow, event: *RgfwEvent) callconv(.c) bool;
extern "rgfw" fn RGFW_window_close(win: *RgfwWindow) callconv(.c) void;
extern "rgfw" fn RGFW_window_closePtr(win: *RgfwWindow) callconv(.c) void;
extern "rgfw" fn RGFW_window_didDataDrop(win: *RgfwWindow) callconv(.c) void;
extern "rgfw" fn RGFW_window_didMouseEnter(win: *RgfwWindow) callconv(.c) bool;
extern "rgfw" fn RGFW_window_didMouseLeave(win: *RgfwWindow) callconv(.c) bool;
extern "rgfw" fn RGFW_window_focus(win: *RgfwWindow) callconv(.c) void;
extern "rgfw" fn RGFW_window_getDataDrag(win: *RgfwWindow, x: *i32, y: *i32) callconv(.c) bool;
extern "rgfw" fn RGFW_window_getDataDrop(win: *RgfwWindow, files: *[][*:0]const u8, count: *usize) callconv(.c) bool;
extern "rgfw" fn RGFW_window_getMouse(win: *RgfwWindow, x: *i32, y: *i32) callconv(.c) bool;
extern "rgfw" fn RGFW_window_hide(win: *RgfwWindow) callconv(.c) void;
extern "rgfw" fn RGFW_window_holdMouse(win: *RgfwWindow, area: RgfwArea) callconv(.c) void;
extern "rgfw" fn RGFW_window_isDataDragging(win: *RgfwWindow) callconv(.c) bool;
extern "rgfw" fn RGFW_window_isFloating(win: *RgfwWindow) callconv(.c) bool;
extern "rgfw" fn RGFW_window_isFullscreen(win: *RgfwWindow) callconv(.c) bool;
extern "rgfw" fn RGFW_window_isHidden(win: *RgfwWindow) callconv(.c) bool;
extern "rgfw" fn RGFW_window_isHoldingMouse(win: *RgfwWindow) callconv(.c) bool;
extern "rgfw" fn RGFW_window_isInFocus(win: *RgfwWindow) callconv(.c) bool;
extern "rgfw" fn RGFW_window_isKeyDown(win: *RgfwWindow, key: RgfwKey) callconv(.c) bool;
extern "rgfw" fn RGFW_window_isKeyPressed(win: *RgfwWindow, key: RgfwKey) callconv(.c) bool;
extern "rgfw" fn RGFW_window_isKeyReleased(win: *RgfwWindow, key: RgfwKey) callconv(.c) bool;
extern "rgfw" fn RGFW_window_isMaximized(win: *RgfwWindow) callconv(.c) bool;
extern "rgfw" fn RGFW_window_isMinimized(win: *RgfwWindow) callconv(.c) bool;
extern "rgfw" fn RGFW_window_isMouseDown(win: *RgfwWindow, button: RgfwMouseButton) callconv(.c) bool;
extern "rgfw" fn RGFW_window_isMouseHidden(win: *RgfwWindow) callconv(.c) bool;
extern "rgfw" fn RGFW_window_isMouseInside(win: *RgfwWindow) callconv(.c) bool;
extern "rgfw" fn RGFW_window_isMousePressed(win: *RgfwWindow, button: RgfwMouseButton) callconv(.c) bool;
extern "rgfw" fn RGFW_window_isMouseReleased(win: *RgfwWindow, button: RgfwMouseButton) callconv(.c) bool;
extern "rgfw" fn RGFW_window_maximize(win: *RgfwWindow) callconv(.c) void;
extern "rgfw" fn RGFW_window_minimize(win: *RgfwWindow) callconv(.c) void;
extern "rgfw" fn RGFW_window_move(win: *RgfwWindow, v: RgfwPoint) callconv(.c) void;
extern "rgfw" fn RGFW_window_moveMouse(win: *RgfwWindow, v: RgfwPoint) callconv(.c) void;
extern "rgfw" fn RGFW_window_moveToMonitor(win: *RgfwWindow, m: RgfwMonitor) callconv(.c) void;
extern "rgfw" fn RGFW_window_raise(win: *RgfwWindow) callconv(.c) void;
extern "rgfw" fn RGFW_window_resize(win: *RgfwWindow, a: RgfwArea) callconv(.c) void;
extern "rgfw" fn RGFW_window_restore(win: *RgfwWindow) callconv(.c) void;
extern "rgfw" fn RGFW_window_setAspectRatio(win: *RgfwWindow, a: RgfwArea) callconv(.c) void;
extern "rgfw" fn RGFW_window_setBorder(win: *RgfwWindow, border: bool) callconv(.c) void;
extern "rgfw" fn RGFW_window_setDND(win: *RgfwWindow, allow: bool) callconv(.c) void;
extern "rgfw" fn RGFW_window_setFlags(win: *RgfwWindow, flags: u32) callconv(.c) void;
extern "rgfw" fn RGFW_window_setFloating(win: *RgfwWindow, floating: bool) callconv(.c) void;
extern "rgfw" fn RGFW_window_setFullscreen(win: *RgfwWindow, fullscreen: bool) callconv(.c) void;
extern "rgfw" fn RGFW_window_setIcon(win: *RgfwWindow, data: *u8, w: i32, h: i32, format: RgfwFormat) callconv(.c) bool;
extern "rgfw" fn RGFW_window_setIconEx(win: *RgfwWindow, data: *u8, w: i32, h: i32, format: RgfwFormat, icon_type: RgfwIcon) callconv(.c) void;
extern "rgfw" fn RGFW_window_setMaxSize(win: *RgfwWindow, a: RgfwArea) callconv(.c) void;
extern "rgfw" fn RGFW_window_setMinSize(win: *RgfwWindow, a: RgfwArea) callconv(.c) void;
extern "rgfw" fn RGFW_window_setMouse(win: *RgfwWindow, mouse: *RgfwMouse) callconv(.c) void;
extern "rgfw" fn RGFW_window_setMouseDefault(win: *RgfwWindow) callconv(.c) bool;
extern "rgfw" fn RGFW_window_setMousePassthrough(win: *RgfwWindow, passthrough: bool) callconv(.c) void;
extern "rgfw" fn RGFW_window_setMouseStandard(win: *RgfwWindow, mouse: RgfwMouseIcons) callconv(.c) void;
extern "rgfw" fn RGFW_window_setName(win: *RgfwWindow, name: [*c]const u8) callconv(.c) void;
extern "rgfw" fn RGFW_window_setOpacity(win: *RgfwWindow, opacity: u8) callconv(.c) void;
extern "rgfw" fn RGFW_window_setShouldClose(win: *RgfwWindow, should_close: bool) void;
extern "rgfw" fn RGFW_window_shouldClose(win: *RgfwWindow) callconv(.c) bool;
extern "rgfw" fn RGFW_window_show(win: *RgfwWindow) callconv(.c) void;
extern "rgfw" fn RGFW_window_showMouse(win: *RgfwWindow, show: bool) callconv(.c) void;
extern "rgfw" fn RGFW_window_unholdMouse(win: *RgfwWindow) callconv(.c) void;
