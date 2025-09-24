const rgfw = @import("rgfw.zig");

const RgfwKey = rgfw.RgfwKey;
const RgfwMouseButton = rgfw.RgfwMouseButton;
const RgfwWindow = rgfw.RgfwWindow;

// MARK: Functions

/// Get the current scroll value (of the frame).
///
/// @remarks The original name for this function in RGFW is `RGFW_getMouseScroll`.
pub fn rgfwGetMouseScroll(x: *f32, y: *f32) bool {
    return RGFW_getMouseScroll(x, y);
}

/// Get the current vector value (of the frame).
///
/// @remarks The original name for this function in RGFW is `RGFW_getMouseVector`.
pub fn rgfwGetMouseVector(x: *f32, y: *f32) bool {
    return RGFW_getMouseVector(x, y);
}

/// @brief If key is held (key code).
///
/// @remarks The original name for this function in RGFW is `RGFW_isKeyDown`.
pub fn rgfwIsKeyDown(key: RgfwKey) bool {
    return RGFW_isKeyDown(key);
}

/// @brief If key is pressed during the current frame (key code).
///
/// @remarks The original name for this function in RGFW is `RGFW_isKeyPressed`.
pub fn rgfwIsKeyPressed(key: RgfwKey) bool {
    return RGFW_isKeyPressed(key);
}

/// @brief If key is released (key code)
///
/// @remarks The original name for this function in RGFW is `RGFW_isKeyReleased`.
pub fn rgfwIsKeyReleased(key: RgfwKey) bool {
    return RGFW_isKeyReleased(key);
}

/// @brief If a mouse button is down.
///
/// @remarks The original name for this function in RGFW is `RGFW_isMouseDown`.
pub fn rgfwIsMouseDown(button: RgfwMouseButton) bool {
    return RGFW_isMouseDown(button);
}

/// @brief If a mouse button is pressed during the current frame.
///
/// @remarks The original name for this function in RGFW is `RGFW_isMousePressed`.
pub fn rgfwIsMousePressed(button: RgfwMouseButton) bool {
    return RGFW_isMousePressed(button);
}

/// @brief If a mouse button was released
///
/// @remarks The original name for this function in RGFW is `RGFW_isMouseReleased`.
pub fn rgfwIsMouseReleased(win: *RgfwWindow, button: RgfwMouseButton) bool {
    return RGFW_isMouseReleased(win, button);
}

// MARK: C Functions

extern "rgfw" fn RGFW_getMouseScroll(x: *f32, y: *f32) callconv(.c) bool;
extern "rgfw" fn RGFW_getMouseVector(x: *f32, y: *f32) callconv(.c) bool;
extern "rgfw" fn RGFW_isMouseDown(button: RgfwMouseButton) callconv(.c) bool;
extern "rgfw" fn RGFW_isMousePressed(button: RgfwMouseButton) callconv(.c) bool;
extern "rgfw" fn RGFW_isMouseReleased(button: RgfwMouseButton) callconv(.c) bool;
extern "rgfw" fn RGFW_isKeyDown(key: RgfwKey) callconv(.c) bool;
extern "rgfw" fn RGFW_isKeyPressed(key: RgfwKey) callconv(.c) bool;
extern "rgfw" fn RGFW_isKeyReleased(key: RgfwKey) callconv(.c) bool;
