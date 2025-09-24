const std = @import("std");

// MARK: Functions

/// @brief Read clipboard data.
///
/// @remarks The original name for this function in RGFW is `RGFW_readClipboard`.
pub fn rgfwReadClipboard(size: *usize) []const u8 {
    return RGFW_readClipboard(std.mem.span(RGFW_readClipboard(size)));
}

/// @brief Read clipboard data.
///
/// @remarks The original name for this function in RGFW is `RGFW_readClipboard`.
pub fn rgfwReadClipboardPtr(str: *?[*c]const u8, size: *usize) usize {
    return RGFW_readClipboard(std.mem.span(RGFW_readClipboardPtr(str, size)));
}

/// @brief Write text to the clipboard
///
/// @remarks The original name for this function in RGFW is `RGFW_writeClipboard`.
pub fn rgfwWriteClipboard(text: []const u8, text_len: u32) []const u8 {
    return RGFW_writeClipboard(text.ptr, text_len);
}

// MARK: C Functions

extern "rgfw" fn RGFW_readClipboard(size: *usize) callconv(.c) [*c]const u8;
extern "rgfw" fn RGFW_readClipboardPtr(str: *?[*c]u8, str_capacity: usize) callconv(.c) usize;
extern "rgfw" fn RGFW_writeClipboard(text: [*c]const u8, text_len: u32) callconv(.c) void;
