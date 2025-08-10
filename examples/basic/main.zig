//! @brief An example showing basic RGFW usage.
//!
//! @details This is a direct copy of RGFW's `basic.c` example but translated into Zig but without
//! the OpenGL code since I'm not planning on supporting that (at least for the initial release).

const std = @import("std");
const rgfw = @import("rgfw");

pub fn main() !void {
    rgfw.rgfwSetClassName("RGFW Example");
    const win = rgfw.rgfwCreateWindow(
        "RGFW Example Window",
        .{ .h = 500, .w = 500, .x = 500, .y = 500 },
        @intFromEnum(rgfw.RgfwWindowFlags.rgfw_window_center) | @intFromEnum(rgfw.RgfwWindowFlags.rgfw_window_allow_dnd),
    );

    rgfw.rgfwWindowSetMouseStandard(win, rgfw.RgfwMouseIcons.rgfw_mouse_resize_n_e_s_w);

    while (!rgfw.rgfwWindowShouldClose(win)) {
        var event: rgfw.RgfwEvent = undefined;
        while (rgfw.rgfwWindowCheckEvent(win, &event)) {
            switch (event.type) {
                .rgfw_quit => {
                    rgfw.rgfwWindowSetShouldClose(win, true);
                    break;
                },
                else => {},
            }
        }
    }
}
