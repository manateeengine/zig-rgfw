const std = @import("std");

/// @brief Read clipboard data.
///
/// @remarks The original name for this function in RGFW is `RGFW_readClipboard`.
///
/// @see [The RGFW Docs](https://colleagueriley.github.io/RGFW/docs/group__Clipboard.html#ga8dc0a4b9144cd7e9de02f31b2b421723)
pub fn rgfwReadClipboard(size: *usize) []const u8 {
    return RGFW_readClipboard(std.mem.span(RGFW_readClipboard(size)));
}

extern "rgfw" fn RGFW_readClipboard(size: *usize) callconv(.c) [*c]const u8;
extern "rgfw" fn RGFW_readClipboardPtr(str: [*c]u8, str_capacity: usize) callconv(.c) usize;
extern "rgfw" fn RGFW_writeClipboard(text: [*c]const u8, text_len: u32) callconv(.c) void;
