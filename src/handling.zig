const std = @import("std");

// MARK: Enums

/// @brief No brief description was provided by RGFW.
///
/// @remarks The original name for this enum in RGFW is `RGFW_debugType`.
const RgfwDebugType = enum(u8) {
    /// @brief No brief description was provided by RGFW.
    ///
    /// @remarks The original name for this constant in RGFW is `RGFW_typeError`.
    rgfw_type_error = 0,
    /// @brief No brief description was provided by RGFW.
    ///
    /// @remarks The original name for this constant in RGFW is `RGFW_typeWarning`.
    rgfw_type_warning = 1,
    /// @brief No brief description was provided by RGFW.
    ///
    /// @remarks The original name for this constant in RGFW is `RGFW_typeInfo`.
    rgfw_type_info = 2,
};

/// @brief No brief description was provided by RGFW.
///
/// @remarks The original name for this enum in RGFW is `RGFW_errorCode`.
const RgfwErrorCode = enum(u8) {
    /// @brief No error.
    ///
    /// @remarks The original name for this constant in RGFW is `RGFW_noError`.
    rgfw_no_error = 0,
    /// @brief No brief description was provided by RGFW.
    ///
    /// @remarks The original name for this constant in RGFW is `RGFW_errOutOfMemory`.
    rgfw_err_out_of_memory = 1,
    /// @brief Error with the OpenGL context.
    ///
    /// @remarks The original name for this constant in RGFW is `RGFW_errOpenGLContext`.
    rgfw_err_open_gl_context = 2,
    /// @brief Error with the OpenGL context.
    ///
    /// @remarks The original name for this constant in RGFW is `RGFW_errEGLContext`.
    rgfw_err_egl_context = 3,
    /// @brief No brief description was provided by RGFW.
    ///
    /// @remarks The original name for this constant in RGFW is ``RGFW_errWayland.
    rgfw_err_wayland = 4,
    /// @brief No brief description was provided by RGFW.
    ///
    /// @remarks The original name for this constant in RGFW is `RGFW_errX11`.
    rgfw_err_x11 = 5,
    /// @brief No brief description was provided by RGFW.
    ///
    /// @remarks The original name for this constant in RGFW is `RGFW_errDirectXContext`.
    rgfw_err_direct_x_context = 6,
    /// @brief No brief description was provided by RGFW.
    ///
    /// @remarks The original name for this constant in RGFW is `RGFW_errIOKit`.
    rgfw_err_io_kit = 7,
    /// @brief No brief description was provided by RGFW.
    ///
    /// @remarks The original name for this constant in RGFW is ``RGFW_errClipboard.
    rgfw_err_clipboard = 8,
    /// @brief No brief description was provided by RGFW.
    ///
    /// @remarks The original name for this constant in RGFW is `RGFW_errFailedFuncLoad`.
    rgfw_err_failed_func_load = 9,
    /// @brief No brief description was provided by RGFW.
    ///
    /// @remarks The original name for this constant in RGFW is `RGFW_errBuffer`.
    rgfw_err_buffer = 10,
    /// @brief No brief description was provided by RGFW.
    ///
    /// @remarks The original name for this constant in RGFW is `RGFW_errEventQueue`.
    rgfw_err_event_queue = 11,
    /// @brief No brief description was provided by RGFW.
    ///
    /// @remarks The original name for this constant in RGFW is `RGFW_infoMonitor`.
    rgfw_info_monitor = 12,
    /// @brief No brief description was provided by RGFW.
    ///
    /// @remarks The original name for this constant in RGFW is `RGFW_infoWindow`.
    rgfw_info_window = 13,
    /// @brief No brief description was provided by RGFW.
    ///
    /// @remarks The original name for this constant in RGFW is `RGFW_infoBuffer`.
    rgfw_info_buffer = 14,
    /// @brief No brief description was provided by RGFW.
    ///
    /// @remarks The original name for this constant in RGFW is `RGFW_infoGlobal`.
    rgfw_info_global = 15,
    /// @brief No brief description was provided by RGFW.
    ///
    /// @remarks The original name for this constant in RGFW is `RGFW_infoOpenGL`.
    rgfw_info_open_gl = 16,
    /// @brief No brief description was provided by RGFW.
    ///
    /// @remarks The original name for this constant in RGFW is `RGFW_warningWayland`.
    rgfw_warning_wayland = 17,
    /// @brief No brief description was provided by RGFW.
    ///
    /// @remarks The original name for this constant in RGFW is `RGFW_warningOpenGL`.
    rgfw_warning_open_gl = 18,
};

// MARK: Functions

/// @brief No brief description was provided by RGFW.
///
/// @remarks The original name for this function in RGFW is `RGFW_sendDebugInfo`.
pub fn rgfwSendDebugInfo(debug_type: RgfwDebugType, err: RgfwErrorCode, msg: []const u8) void {
    return RGFW_sendDebugInfo(debug_type, err, msg.ptr);
}

/// @brief No brief description was provided by RGFW.
///
/// @remarks The original name for this function in RGFW is `RGFW_sendDebugInfo`.
pub fn rgfwSetDebugCallback(func: RgfwDebugFunc) void {
    return RGFW_setDebugCallback(func);
}

// MARK: Types

/// @brief No brief description was provided by RGFW.
///
/// @remarks The original name for this type in RGFW is `RGFW_debugFunc`.
const RgfwDebugFunc = *const fn (debug_type: RgfwDebugType, err: RgfwErrorCode, msg: [*c]const u8) callconv(.c) void;

// MARK: C Functions

extern "c" fn RGFW_sendDebugInfo(debug_type: RgfwDebugType, err: RgfwErrorCode, msg: [*c]const u8) callconv(.c) void;
extern "c" fn RGFW_setDebugCallback(func: RgfwDebugFunc) callconv(.c) void;
