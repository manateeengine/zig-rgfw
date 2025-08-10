const rgfw = @import("rgfw.zig");

const RgfwKey = rgfw.RgfwKey;
const RgfwMouseButton = rgfw.RgfwMouseButton;
const RgfwWindow = rgfw.RgfwWindow;

/// @brief No brief description was provided by RGFW.
///
/// @remarks The original name for this function in RGFW is `RGFW_isClicked`.
///
/// @see [The RGFW Docs](https://colleagueriley.github.io/RGFW/docs/group__Input.html#ga04986425d9881d78ba3d4f6e2c8a4368)
pub fn rgfwIsClicked(win: *RgfwWindow, key: RgfwKey) bool {
    return RGFW_isClicked(win, key);
}

/// @brief If key is held (key code).
///
/// @remarks The original name for this function in RGFW is `RGFW_isHeld`.
///
/// @see [The RGFW Docs](https://colleagueriley.github.io/RGFW/docs/group__Input.html#ga6fe119d8239e7cc6fdf07ae378e2658b)
pub fn rgfwIsHeld(win: *RgfwWindow, key: RgfwKey) bool {
    return RGFW_isHeld(win, key);
}

/// @brief If a mouse button is held.
///
/// @remarks The original name for this function in RGFW is `RGFW_isMouseHeld`.
///
/// @see [The RGFW Docs](https://colleagueriley.github.io/RGFW/docs/group__Input.html#gab88bec0f869a9000ed3703a7bfe61278)
pub fn rgfwIsMouseHeld(win: *RgfwWindow, button: RgfwMouseButton) bool {
    return RGFW_isMouseHeld(win, button);
}

/// @brief If a mouse button is pressed.
///
/// @remarks The original name for this function in RGFW is `RGFW_isMousePressed`.
///
/// @see [The RGFW Docs](https://colleagueriley.github.io/RGFW/docs/group__Input.html#ga730c6f8a9a8815c2f02288ccf51d41ad)
pub fn rgfwIsMousePressed(win: *RgfwWindow, button: RgfwMouseButton) bool {
    return RGFW_isMousePressed(win, button);
}

/// @brief If a mouse button was released
///
/// @remarks The original name for this function in RGFW is `RGFW_isMouseReleased`.
///
/// @see [The RGFW Docs](https://colleagueriley.github.io/RGFW/docs/group__Input.html#gac3ad11fe46449b780172cea27350b324)
pub fn rgfwIsMouseReleased(win: *RgfwWindow, button: RgfwMouseButton) bool {
    return RGFW_isMouseReleased(win, button);
}

/// @brief If key is pressed (key code).
///
/// @details If window == `null`, it checks if the key is pressed globally. Otherwise, it checks
///          only if the key is pressed while the window in focus.
///
/// @remarks The original name for this function in RGFW is `RGFW_isPressed`.
///
/// @see [The RGFW Docs](https://colleagueriley.github.io/RGFW/docs/group__Input.html#ga6edb31c11775f450c7f3554771fbc252)
pub fn rgfwIsPressed(win: *RgfwWindow, key: RgfwKey) bool {
    return RGFW_isPressed(win, key);
}

/// @brief If key is released (key code)
///
/// @remarks The original name for this function in RGFW is `RGFW_isReleased`.
///
/// @see [The RGFW Docs](https://colleagueriley.github.io/RGFW/docs/group__Input.html#ga379b35a3e3d4d5b230aa2b22fc2d5e0c)
pub fn rgfwIsReleased(win: *RgfwWindow, key: RgfwKey) bool {
    return RGFW_isReleased(win, key);
}

/// @brief If a mouse button was pressed (checks previous state only).
///
/// @remarks The original name for this function in RGFW is `RGFW_wasMousePressed`.
///
/// @see [The RGFW Docs](https://colleagueriley.github.io/RGFW/docs/group__Input.html#ga9f2cce6197de5cb5a46d67e5caeb3701)
pub fn rgfwWasMousePressed(win: *RgfwWindow, button: RgfwMouseButton) bool {
    return RGFW_wasMousePressed(win, button);
}

/// @brief If key was pressed (checks previous state only) (key code).
///
/// @remarks The original name for this function in RGFW is `RGFW_wasPressed`.
///
/// @see [The RGFW Docs](https://colleagueriley.github.io/RGFW/docs/group__Input.html#ga9940f3a1b5e9918c1639a2986a120f33)
pub fn rgfwWasPressed(win: *RgfwWindow, key: RgfwKey) bool {
    return RGFW_wasPressed(win, key);
}

extern "rgfw" fn RGFW_isClicked(win: *RgfwWindow, key: RgfwKey) callconv(.c) bool;
extern "rgfw" fn RGFW_isHeld(win: *RgfwWindow, key: RgfwKey) callconv(.c) bool;
extern "rgfw" fn RGFW_isMouseHeld(win: *RgfwWindow, button: RgfwMouseButton) callconv(.c) bool;
extern "rgfw" fn RGFW_isMousePressed(win: *RgfwWindow, button: RgfwMouseButton) callconv(.c) bool;
extern "rgfw" fn RGFW_isMouseReleased(win: *RgfwWindow, button: RgfwMouseButton) callconv(.c) bool;
extern "rgfw" fn RGFW_isPressed(win: *RgfwWindow, key: RgfwKey) callconv(.c) bool;
extern "rgfw" fn RGFW_isReleased(win: *RgfwWindow, key: RgfwKey) callconv(.c) bool;
extern "rgfw" fn RGFW_wasMousePressed(win: *RgfwWindow, button: RgfwMouseButton) callconv(.c) bool;
extern "rgfw" fn RGFW_wasPressed(win: *RgfwWindow, key: RgfwKey) callconv(.c) bool;
