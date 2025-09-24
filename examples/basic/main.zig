//! @brief An example showing basic RGFW usage.
//!
//! @details This is a direct copy of RGFW's example in the README, but translated into Zig without
//! the OpenGL code since I'm not planning on supporting that (at least for the initial release).

const std = @import("std");
const rgfw = @import("rgfw");

pub fn main() !void {
    const win = rgfw.rgfwCreateWindow(
        "a window",
        0,
        0,
        800,
        600,
        rgfw.RgfwWindowFlags{
            .rgfw_window_center = true,
            .rgfw_window_no_resize = true,
        },
    );

    // TODO: Implement callbacks

    while (!rgfw.rgfwWindowShouldClose(win)) {
        var event: rgfw.RgfwEvent = undefined;
        while (rgfw.rgfwWindowCheckEvent(win, &event)) {
            // You can either check the current event yourself
            if (event.event_type == .rgfw_quit) {
                break;
            }

            if (event.event_type == .rgfw_mouse_button_pressed and event.button.value == @intFromEnum(rgfw.RgfwMouseButton.rgfw_mouse_left)) {
                std.log.info("You clicked at x: {}, y: {}", .{ event.mouse.x, event.mouse.y });
            }

            // Or use the existing functions
            if (rgfw.rgfwIsMousePressed(.rgfw_mouse_right)) {
                std.log.info("The right mouse button was clicked at: {}, y: {}", .{ event.mouse.x, event.mouse.y });
            }
        }
    }

    rgfw.rgfwWindowClose(win);
}
