const monitor = @import("monitor.zig");
const rgfw = @import("rgfw.zig");

const RgfwMonitor = monitor.RgfwMonitor;
const RgfwArea = rgfw.RgfwArea;
const RgfwEvent = rgfw.RgfwEvent;
const RgfwImage = rgfw.RgfwImage;
const RgfwMouse = rgfw.RgfwMouse;
const RgfwPoint = rgfw.RgfwPoint;
const RgfwRect = rgfw.RgfwRect;
const RgfwWindow = rgfw.RgfwWindow;

pub const RgfwIcon = enum(u8) {
    rgfw_icon_taskbar = 0,
    rgfw_icon_window = 1,
    rgfw_icon_both = 0 | 1,
};

pub const RgfwMouseIcons = enum(u8) {
    rgfw_mouse_normal = 0,
    rgfw_mouse_arrow = 1,
    rgfw_mouse_i_beam = 2,
    rgfw_mouse_crosshair = 3,
    rgfw_mouse_pointing_hand = 4,
    rgfw_mouse_resize_e_w = 5,
    rgfw_mouse_resize_n_s = 6,
    rgfw_mouse_resize_n_w_s_e = 7,
    rgfw_mouse_resize_n_e_s_w = 8,
    rgfw_mouse_resize_all = 9,
    rgfw_mouse_not_allowed = 10,
    rgfw_mouse_icon_final = 16,
};

/// @brief Function to create a window and struct.
///
/// @remarks The original name for this function in RGFW is `RGFW_createWindow`.
///
/// @see [The RGFW Docs](https://colleagueriley.github.io/RGFW/docs/group__Window__management.html#gaf8a8eaf0d6031adb217117e43f161a3c)
pub fn rgfwCreateWindow(name: []const u8, rect: RgfwRect, flags: u32) *RgfwWindow {
    return RGFW_createWindow(name.ptr, rect, flags);
}

/// @brief Function to create a window (without allocating a window struct)
///
/// @remarks The original name for this function in RGFW is `RGFW_createWindowPtr`.
///
/// @see [The RGFW Docs](https://colleagueriley.github.io/RGFW/docs/group__Window__management.html#gacd2a85f50be8de9991ce67e760ee1c7a)
pub fn rgfwCreateWindowPtr(name: []const u8, rect: RgfwRect, flags: u32, win: *RgfwWindow) *RgfwWindow {
    return RGFW_createWindowPtr(name.ptr, rect, flags, win);
}

/// @brief Where the mouse is on the screen.
///
/// @remarks The original name for this function in RGFW is `RGFW_getMousePoint`.
///
/// @see [The RGFW Docs](https://colleagueriley.github.io/RGFW/docs/group__Window__management.html#ga3b903f5b6250cde957362ec3bffe8914)
pub fn rgfwGetMousePoint() RgfwArea {
    return RGFW_getMousePoint();
}

/// @brief Get the size of the screen to an area struct.
///
/// @remarks The original name for this function in RGFW is `RGFW_getScreenSize`.
///
/// @see [The RGFW Docs](https://colleagueriley.github.io/RGFW/docs/group__Window__management.html#ga2952eee39f36b85b6829976656043f97)
pub fn rgfwGetScreenSize() RgfwArea {
    return RGFW_getScreenSize();
}

/// @brief (Cocoa only) change directory to resource folder.
///
/// @remarks The original name for this function in RGFW is `RGFW_moveToMacOSResourceDir`.
///
/// @see [The RGFW Docs](https://colleagueriley.github.io/RGFW/docs/group__Window__management.html#gac67121a641fb36365fa5dc06004307c2)
pub fn rgfwMoveToMacOsResourceDir() void {
    return RGFW_moveToMacOSResourceDir();
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

/// @brief X11 instance name (window name will by used by default).
///
/// @remarks The original name for this function in RGFW is `RGFW_setXInstName`.
///
/// @see [The RGFW Docs](https://colleagueriley.github.io/RGFW/docs/group__Window__management.html#ga01315659b679358f434b95ff9d66935f)
pub fn rgfwSetXInstName(name: []const u8) void {
    return RGFW_setXInstName(name.ptr);
}

/// @brief Check if DND is allowed.
///
/// @remarks The original name for this function in RGFW is `RGFW_window_allowsDND`.
///
/// @see [The RGFW Docs](https://colleagueriley.github.io/RGFW/docs/group__Window__management.html#ga60516750e05a503395bd4e7dbfeb9a0a)
pub fn rgfwWindowAllowsDnd(win: *RgfwWindow) bool {
    return RGFW_window_allowsDND(win);
}

/// @brief No brief description was provided by RGFW.
///
/// @remarks The original name for this function in RGFW is `RGFW_window_borderless`.
///
/// @see [The RGFW Docs](https://colleagueriley.github.io/RGFW/docs/group__Window__management.html#gacbbf5186b802bd637defa9dea7c086bc)
pub fn rgfwWindowBorderless(win: *RgfwWindow) bool {
    return RGFW_window_borderless(win);
}

/// @brief Center the window.
///
/// @remarks The original name for this function in RGFW is `RGFW_window_center`.
///
/// @see [The RGFW Docs](https://colleagueriley.github.io/RGFW/docs/group__Window__management.html#ga8e9fd2dbbbf3a74f18173e2793955dda)
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
///
/// @see [The RGFW Docs](https://colleagueriley.github.io/RGFW/docs/group__Window__management.html#ga24a216d1304d457e92b07504dda3fabb)
pub fn rgfwWindowCheckEvent(win: *RgfwWindow, event: *RgfwEvent) bool {
    return RGFW_window_checkEvent(win, event);
}

/// @brief Pops the first event for the window from the event queue.
///
/// @remarks The original name for this function in RGFW is `RGFW_window_checkQueuedEvent`.
///
/// @see [The RGFW Docs](https://colleagueriley.github.io/RGFW/docs/group__Window__management.html#ga8a75a2c74318e91e6d9b1c64ec7559d7)
pub fn rgfwWindowCheckQueuedEvent(win: *RgfwWindow, event: *RgfwEvent) bool {
    return RGFW_window_checkQueuedEvent(win, event);
}

/// @brief Window management functions close the window and free leftover data.
///
/// @remarks The original name for this function in RGFW is `RGFW_window_close`.
///
/// @see [The RGFW Docs](https://colleagueriley.github.io/RGFW/docs/group__Window__management.html#gab9fbaeec9a1268374ab141b6ccfc41a3)
pub fn rgfwWindowClose(win: *RgfwWindow) void {
    return RGFW_window_close(win);
}

/// @brief Sets the focus to this window.
///
/// @remarks The original name for this function in RGFW is `RGFW_window_focus`.
///
/// @see [The RGFW Docs](https://colleagueriley.github.io/RGFW/docs/group__Window__management.html#ga2f4b6c35c012889e20ef9966c145134d)
pub fn rgfwWindowFocus(win: *RgfwWindow) void {
    return RGFW_window_focus(win);
}

/// @brief Where the mouse is on the window
///
/// @remarks The original name for this function in RGFW is `RGFW_window_getMousePoint`.
///
/// @see [The RGFW Docs](https://colleagueriley.github.io/RGFW/docs/group__Window__management.html#ga1d970bf9f2042f7ccdd6c132c6f576fa)
pub fn rgfwWindowGetMousePoint(win: *RgfwWindow) RgfwPoint {
    return RGFW_window_getMousePoint(win);
}

/// @brief hide the window
///
/// @remarks The original name for this function in RGFW is `RGFW_window_hide`.
///
/// @see [The RGFW Docs](https://colleagueriley.github.io/RGFW/docs/group__Window__management.html#gad0dd15469e9f8648345b52f0f9c0c023)
pub fn rgfwWindowHide(win: *RgfwWindow) void {
    return RGFW_window_hide(win);
}

/// @brief No brief description was provided by RGFW.
///
/// @remarks The original name for this function in RGFW is `RGFW_window_holdMouse`.
///
/// @see [The RGFW Docs](https://colleagueriley.github.io/RGFW/docs/group__Window__management.html#gaaa725e300459fce5b9d1335505729576)
pub fn rgfwWindowHoldMouse(win: *RgfwWindow, area: RgfwArea) void {
    return RGFW_window_holdMouse(win, area);
}

/// @brief If the window is floating.
///
/// @remarks The original name for this function in RGFW is `RGFW_window_isFloating`.
///
/// @see [The RGFW Docs](https://colleagueriley.github.io/RGFW/docs/group__Window__management.html#gaaa725e300459fce5b9d1335505729576)
pub fn rgfwWindowIsFloating(win: *RgfwWindow) bool {
    return RGFW_window_isFloating(win);
}

/// @brief If the window is fullscreen.
///
/// @remarks The original name for this function in RGFW is `RGFW_window_isFullscreen`.
///
/// @see [The RGFW Docs](https://colleagueriley.github.io/RGFW/docs/group__Window__management.html#gaf42393d36b8798a22117fa12c396e757)
pub fn rgfwWindowIsFullscreen(win: *RgfwWindow) bool {
    return RGFW_window_isFullscreen(win);
}

/// @brief If the window is hidden
///
/// @remarks The original name for this function in RGFW is `RGFW_window_isHidden`.
///
/// @see [The RGFW Docs](https://colleagueriley.github.io/RGFW/docs/group__Window__management.html#ga6c5edc3fef40721ec9d701d77295519d)
pub fn rgfwWindowIsHidden(win: *RgfwWindow) bool {
    return RGFW_window_isHidden(win);
}

/// @brief Checks the focus to this window
///
/// @remarks The original name for this function in RGFW is `RGFW_window_isInFocus`.
///
/// @see [The RGFW Docs](https://colleagueriley.github.io/RGFW/docs/group__Window__management.html#gaa95e38f35b8f993406a8185cd4b48871)
pub fn rgfwWindowIsInFocus(win: *RgfwWindow) bool {
    return RGFW_window_isInFocus(win);
}

/// @brief If the window is maximized
///
/// @remarks The original name for this function in RGFW is `RGFW_window_isMaximized`.
///
/// @see [The RGFW Docs](https://colleagueriley.github.io/RGFW/docs/group__Window__management.html#ga110cc32439e48fb5a4dfd67825f6963a)
pub fn rgfwWindowIsMaximized(win: *RgfwWindow) bool {
    return RGFW_window_isMaximized(win);
}

/// @brief If the window is minimized.
///
/// @remarks The original name for this function in RGFW is `RGFW_window_isMinimized`.
///
/// @see [The RGFW Docs](https://colleagueriley.github.io/RGFW/docs/group__Window__management.html#ga21de6b33899222d8f50760d80dd16dca)
pub fn rgfwWindowIsMinimized(win: *RgfwWindow) bool {
    return RGFW_window_isMinimized(win);
}

/// @brief If the mouse is held by RGFW.
///
/// @remarks The original name for this function in RGFW is RGFW_window_isMouseHeld``.
///
/// @see [The RGFW Docs](https://colleagueriley.github.io/RGFW/docs/group__Window__management.html#gadf529334002f66d7375c0a865a7251c1)
pub fn rgfwWindowIsMouseHeld(win: *RgfwWindow) bool {
    return RGFW_window_isMouseHeld(win);
}

/// @brief If the mouse is hidden.
///
/// @remarks The original name for this function in RGFW is `RGFW_window_isMouseHidden`.
///
/// @see [The RGFW Docs](https://colleagueriley.github.io/RGFW/docs/group__Window__management.html#gac34a197d8f75489cb50817a6a4a3faf2)
pub fn rgfwWindowIsMouseHidden(win: *RgfwWindow) bool {
    return RGFW_window_isMouseHidden(win);
}

/// @brief Maximize the window.
///
/// @remarks The original name for this function in RGFW is `RGFW_window_maximize`.
///
/// @see [The RGFW Docs](https://colleagueriley.github.io/RGFW/docs/group__Window__management.html#ga867c6a774a544f1cf7765feb17da99e1)
pub fn rgfwWindowMaximize(win: *RgfwWindow) void {
    return RGFW_window_maximize(win);
}

/// @brief Minimize the window (in taskbar (per OS)).
///
/// @remarks The original name for this function in RGFW is `RGFW_window_minimize`.
///
/// @see [The RGFW Docs](https://colleagueriley.github.io/RGFW/docs/group__Window__management.html#gadf5a4e9746a8340b1ec5b6f290d7c907)
pub fn rgfwWindowMinimize(win: *RgfwWindow) void {
    return RGFW_window_minimize(win);
}

/// @brief Move a window to a given point.
///
/// @remarks The original name for this function in RGFW is `RGFW_window_move`.
///
/// @see [The RGFW Docs](https://colleagueriley.github.io/RGFW/docs/group__Window__management.html#ga1d2a9a61b4acc071f8cc2723723a3ce5)
pub fn rgfwWindowMove(win: *RgfwWindow, v: RgfwPoint) void {
    return RGFW_window_move(win, v);
}

/// @brief Move the mouse to a given point.
///
/// @remarks The original name for this function in RGFW is `RGFW_window_moveMouse`.
///
/// @see [The RGFW Docs](https://colleagueriley.github.io/RGFW/docs/group__Window__management.html#ga1f8210bbda82bd96122267c39f9c85c3)
pub fn rgfwWindowMoveMouse(win: *RgfwWindow, v: RgfwPoint) void {
    return RGFW_window_moveMouse(win, v);
}

/// @brief Move window to a specific monitor.
///
/// @remarks The original name for this function in RGFW is `RGFW_window_moveToMonitor`.
///
/// @see [The RGFW Docs](https://colleagueriley.github.io/RGFW/docs/group__Window__management.html#ga2fa4deae6ef9c9037d9a182982c41556)
pub fn rgfwWindowMoveToMonitor(win: *RgfwWindow, m: RgfwMonitor) void {
    return RGFW_window_moveToMonitor(win, m);
}

/// @brief Raise the window (to the top).
///
/// @remarks The original name for this function in RGFW is `RGFW_window_raise`.
///
/// @see [The RGFW Docs](https://colleagueriley.github.io/RGFW/docs/group__Window__management.html#ga9cbbfa79e24517e57da59e5cf4abe9e3)
pub fn rgfwWindowRaise(win: *RgfwWindow) void {
    return RGFW_window_raise(win);
}

/// @brief Resize window to a current size/area
///
/// @remarks The original name for this function in RGFW is `RGFW_window_resize`.
///
/// @see [The RGFW Docs](https://colleagueriley.github.io/RGFW/docs/group__Window__management.html#ga49cb75955ec07bb68faf7f260b30e693)
pub fn rgfwWindowResize(win: *RgfwWindow, a: RgfwArea) void {
    return RGFW_window_resize(win, a);
}

/// @brief Restore the window from minimized (per OS).
///
/// @remarks The original name for this function in RGFW is `RGFW_window_restore`.
///
/// @see [The RGFW Docs](https://colleagueriley.github.io/RGFW/docs/group__Window__management.html#ga68d347a9064621a8691398f358ee46a3)
pub fn rgfwWindowRestore(win: *RgfwWindow) void {
    return RGFW_window_restore(win);
}

/// @brief Set window aspect ratio.
///
/// @remarks The original name for this function in RGFW is `RGFW_window_setAspectRatio`.
///
/// @see [The RGFW Docs](https://colleagueriley.github.io/RGFW/docs/group__Window__management.html#gaca9c6225eb590dc1c792907b9a8346b2)
pub fn rgfwWindowSetAspectRatio(win: *RgfwWindow, a: RgfwArea) void {
    return RGFW_window_setAspectRatio(win, a);
}

/// @brief If the window should have a border or not (borderless) based on bool value of border.
///
/// @remarks The original name for this function in RGFW is `RGFW_window_setBorder`.
///
/// @see [The RGFW Docs](https://colleagueriley.github.io/RGFW/docs/group__Window__management.html#ga210cfa064760291d2823fb330ea50d9c)
pub fn rgfwWindowSetBorder(win: *RgfwWindow, border: bool) void {
    return RGFW_window_setBorder(win, border);
}

/// @brief Turn on / off dnd (rgfw_window_allow_dnd still must be passed to the window).
///
/// @remarks The original name for this function in RGFW is `RGFW_window_setDND`.
///
/// @see [The RGFW Docs](https://colleagueriley.github.io/RGFW/docs/group__Window__management.html#gafb366b10a525683266ad9ba0db2760ef)
pub fn rgfwWindowSetDnd(win: *RgfwWindow, allow: bool) void {
    return RGFW_window_setDND(win, allow);
}

/// @brief Set the window flags (will undo flags if they don't match the old ones).
///
/// @remarks The original name for this function in RGFW is `RGFW_window_setFlags`.
///
/// @todo Replace parameter with packed struct once I migrate flags over
///
/// @see [The RGFW Docs](https://colleagueriley.github.io/RGFW/docs/group__Window__management.html#ga1c3a89944c13d571c67be26fdc1041af)
pub fn rgfwWindowSetFlags(window_flags: u32) void {
    return RGFW_window_setFlags(window_flags);
}

/// @brief Make the window a floating window.
///
/// @remarks The original name for this function in RGFW is `RGFW_window_setFloating`.
///
/// @see [The RGFW Docs](https://colleagueriley.github.io/RGFW/docs/group__Window__management.html#ga7a692ef18ae01567c2fdf73c68c08b64)
pub fn rgfwWindowSetFloating(win: *RgfwWindow, floating: bool) void {
    return RGFW_window_setFloating(win, floating);
}

/// @brief Turn fullscreen on / off for a window.
///
/// @remarks The original name for this function in RGFW is `RGFW_window_setFullscreen`.
///
/// @see [The RGFW Docs](https://colleagueriley.github.io/RGFW/docs/group__Window__management.html#ga594d554fefbb56363c7b613dd44e7ee5)
pub fn rgfwWindowSetFullscreen(win: *RgfwWindow, fullscreen: bool) void {
    return RGFW_window_setFullscreen(win, fullscreen);
}

/// @brief Image MAY be resized by default, set both the taskbar and window icon.
///
/// @remarks The original name for this function in RGFW is `RGFW_window_setIcon`.
///
/// @see [The RGFW Docs](https://colleagueriley.github.io/RGFW/docs/group__Window__management.html#ga1bc1a38064fe0c76ef28a010ae86abd8)
pub fn rgfwWindowSetIcon(win: *RgfwWindow, img: RgfwImage) void {
    return RGFW_window_setIcon(win, img);
}

/// @brief Sets mouse to `rgfw_mouse` icon (loaded from a bitmap struct).
///
/// @remarks The original name for this function in RGFW is `RGFW_window_setIconEx`.
///
/// @see [The RGFW Docs](https://colleagueriley.github.io/RGFW/docs/group__Window__management.html#ga0712818a5dc8a5024e2ead74a683b298)
pub fn rgfwWindowSetIconEx(win: *RgfwWindow, img: RgfwImage, icon_type: RgfwIcon) RGFW_window_setIconEx {
    return RGFW_window_setIconEx(win, img, icon_type);
}

/// @brief Set the maximum dimensions of a window
///
/// @remarks The original name for this function in RGFW is `RGFW_window_setMaxSize`.
///
/// @see [The RGFW Docs](https://colleagueriley.github.io/RGFW/docs/group__Window__management.html#gacd5210fddb2ff8e834c25923070ee9f7)
pub fn rgfwWindowSetMaxSize(win: *RgfwWindow, a: RgfwArea) void {
    return RGFW_window_setMaxSize(win, a);
}

/// @brief Set the minimum dimensions of a window
///
/// @remarks The original name for this function in RGFW is `RGFW_window_setMinSize`.
///
/// @see [The RGFW Docs](https://colleagueriley.github.io/RGFW/docs/group__Window__management.html#ga62a242f890c1def944d0b4771b6c79d4)
pub fn rgfwWindowSetMinSize(win: *RgfwWindow, a: RgfwArea) void {
    return RGFW_window_setMinSize(win, a);
}

/// @brief No brief description was provided by RGFW.
///
/// @remarks The original name for this function in RGFW is `RGFW_window_setMouse`.
///
/// @see [The RGFW Docs](https://colleagueriley.github.io/RGFW/docs/group__Window__management.html#gac9c75b705eebbee5e2c86cbaf144a4e0)
pub fn rgfwWindowSetMouse(win: *RgfwWindow, mouse: *RgfwMouse) void {
    return RGFW_window_setMouse(win, mouse);
}

/// @brief Sets the mouse to the default mouse icon.
///
/// @remarks The original name for this function in RGFW is `RGFW_window_setMouseDefault`.
///
/// @see [The RGFW Docs](https://colleagueriley.github.io/RGFW/docs/group__Window__management.html#ga46e9ec7d9e23ed20b38a6046e1b93f49)
pub fn rgfwWindowSetMouseDefault(win: *RgfwWindow) void {
    return RGFW_window_setMouseDefault(win);
}

/// @brief Sets the mouse to a standard API cursor (based on `rgfw_mouse`)
///
/// @remarks The original name for this function in RGFW is `RGFW_window_setMouseStandard`.
///
/// @see [The RGFW Docs](https://colleagueriley.github.io/RGFW/docs/group__Window__management.html#ga28a62377041405463b49dcc68c06cce8)
pub fn rgfwWindowSetMouseStandard(win: *RgfwWindow, mouse: RgfwMouseIcons) void {
    return RGFW_window_setMouseStandard(win, mouse);
}

/// @brief Turn on / off mouse passthrough.
///
/// @remarks The original name for this function in RGFW is `RGFW_window_setMousePassthrough`.
///
/// @see [The RGFW Docs](https://colleagueriley.github.io/RGFW/docs/group__Window__management.html#ga28a62377041405463b49dcc68c06cce8)
pub fn rgfwWindowSetMousePassthrough(win: *RgfwWindow, passthrough: bool) void {
    return RGFW_window_setMousePassthrough(win, passthrough);
}

/// @brief Rename window to a given string.
///
/// @remarks The original name for this function in RGFW is `RGFW_window_setName`.
///
/// @see [The RGFW Docs](https://colleagueriley.github.io/RGFW/docs/group__Window__management.html#ga9f908f5871fe2b172fbaabccab2256bf)
pub fn rgfwWindowSetName(win: *RgfwWindow, name: []const u8) void {
    return RGFW_window_setName(win, name.*);
}

/// @brief Sets the opacity of a window.
///
/// @remarks The original name for this function in RGFW is `RGFW_window_setOpacity`.
///
/// @see [The RGFW Docs](https://colleagueriley.github.io/RGFW/docs/group__Window__management.html#ga54a2347c554cf916668c873cbce48d54)
pub fn rgfwWindowSetOpacity(win: *RgfwWindow, opacity: u8) void {
    return RGFW_window_setOpacity(win, opacity);
}

/// @brief No brief description was provided by RGFW.
///
/// @remarks The original name for this function in RGFW is `RGFW_window_setShouldClose`.
///
/// @see [The RGFW Docs](https://colleagueriley.github.io/RGFW/docs/group__Window__management.html#ga98edf96a90a0f218afeb01908be28fbb)
pub fn rgfwWindowSetShouldClose(win: *RgfwWindow, should_close: bool) void {
    return RGFW_window_setShouldClose(win, should_close);
}

/// @brief If the window should close (`RgfwClose` was sent or escape was pressed) .
///
/// @remarks The original name for this function in RGFW is `RGFW_window_shouldClose`.
///
/// @see [The RGFW Docs](https://colleagueriley.github.io/RGFW/docs/group__Window__management.html#gae40de5fbdc9e850c1ff7e2e8dac46624)
pub fn rgfwWindowShouldClose(win: *RgfwWindow) bool {
    return RGFW_window_shouldClose(win);
}

/// @brief Show the window.
///
/// @remarks The original name for this function in RGFW is `RGFW_window_show`.
///
/// @see [The RGFW Docs](https://colleagueriley.github.io/RGFW/docs/group__Window__management.html#gaf8ea66870c99917ef07acd09ad6d7746)
pub fn rgfwWindowShow(win: *RgfwWindow) void {
    return RGFW_window_show(win);
}

/// @brief Show the mouse or hide the mouse.
///
/// @remarks The original name for this function in RGFW is `RGFW_window_showMouse`.
///
/// @see [The RGFW Docs](https://colleagueriley.github.io/RGFW/docs/group__Window__management.html#gaccfc463b60b5d664a7a6b53e342945dc)
pub fn rgfwWindowShowMouse(win: *RgfwWindow, show: bool) void {
    return RGFW_window_showMouse(win, show);
}

/// @brief Stop holding the mouse and let it move freely.
///
/// @remarks The original name for this function in RGFW is `RGFW_window_unholdMouse`.
///
/// @see [The RGFW Docs](https://colleagueriley.github.io/RGFW/docs/group__Window__management.html#ga04ad62da8d5a1239c544cfa9e1a8479e)
pub fn rgfwWindowUnholdMouse(win: *RgfwWindow) void {
    return RGFW_window_unholdMouse(win);
}

extern "rgfw" fn RGFW_createWindow(name: [*c]const u8, rect: RgfwRect, flags: u32) callconv(.c) *RgfwWindow;
extern "rgfw" fn RGFW_createWindowPtr(name: [*c]const u8, rect: RgfwRect, flags: u32, win: *RgfwWindow) callconv(.c) *RgfwWindow;
extern "rgfw" fn RGFW_getMousePoint() callconv(.c) RgfwArea;
extern "rgfw" fn RGFW_getScreenSize() callconv(.c) RgfwArea;
extern "rgfw" fn RGFW_moveToMacOSResourceDir() callconv(.c) void;
extern "rgfw" fn RGFW_setClassName(name: [*c]const u8) callconv(.c) void;
extern "rgfw" fn RGFW_setXInstName(name: [*c]const u8) callconv(.c) void;
extern "rgfw" fn RGFW_window_allowsDND(win: *RgfwWindow) callconv(.c) bool;
extern "rgfw" fn RGFW_window_borderless(win: *RgfwWindow) callconv(.c) bool;
extern "rgfw" fn RGFW_window_center(win: *RgfwWindow) callconv(.c) void;
extern "rgfw" fn RGFW_window_checkEvent(win: *RgfwWindow, event: *RgfwEvent) callconv(.c) bool;
extern "rgfw" fn RGFW_window_checkQueuedEvent(win: *RgfwWindow, event: *RgfwEvent) callconv(.c) bool;
extern "rgfw" fn RGFW_window_close(win: *RgfwWindow) callconv(.c) void;
extern "rgfw" fn RGFW_window_focus(win: *RgfwWindow) callconv(.c) void;
extern "rgfw" fn RGFW_window_getMousePoint(win: *RgfwWindow) callconv(.c) RgfwPoint;
extern "rgfw" fn RGFW_window_hide(win: *RgfwWindow) callconv(.c) void;
extern "rgfw" fn RGFW_window_holdMouse(win: *RgfwWindow, area: RgfwArea) callconv(.c) void;
extern "rgfw" fn RGFW_window_isFloating(win: *RgfwWindow) callconv(.c) bool;
extern "rgfw" fn RGFW_window_isFullscreen(win: *RgfwWindow) callconv(.c) bool;
extern "rgfw" fn RGFW_window_isHidden(win: *RgfwWindow) callconv(.c) bool;
extern "rgfw" fn RGFW_window_isInFocus(win: *RgfwWindow) callconv(.c) bool;
extern "rgfw" fn RGFW_window_isMaximized(win: *RgfwWindow) callconv(.c) bool;
extern "rgfw" fn RGFW_window_isMinimized(win: *RgfwWindow) callconv(.c) bool;
extern "rgfw" fn RGFW_window_isMouseHeld(win: *RgfwWindow) callconv(.c) bool;
extern "rgfw" fn RGFW_window_isMouseHidden(win: *RgfwWindow) callconv(.c) bool;
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
extern "rgfw" fn RGFW_window_setIcon(win: *RgfwWindow, img: RgfwImage) callconv(.c) void;
extern "rgfw" fn RGFW_window_setIconEx(win: *RgfwWindow, img: RgfwImage, icon_type: RgfwIcon) callconv(.c) void;
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
