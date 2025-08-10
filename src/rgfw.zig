const builtin = @import("builtin");

/// @brief Basic area type, if there's not already an area type of choice.
pub const RgfwArea = extern struct {
    w: i32,
    h: i32,
};

pub const RgfwEvent = extern struct {
    type: RgfwEventType,
    point: RgfwPoint,
    vector: RgfwPoint,
    scale_x: f32,
    scale_y: f32,
    key: RgfwKey,
    key_mod: RgfwKeyMod,
    button: u8,
    scroll: f64,
    dropped_files: *[260]*[260]u8,
    dropped_files_count: usize,
    _win: *anyopaque,
};

pub const RgfwEventType = enum(u8) {
    rgfw_event_none = 0,
    rgfw_key_pressed = 1,
    rgfw_key_released = 2,
    rgfw_mouse_button_pressed = 3,
    rgfw_mouse_button_released = 4,
    rgfw_mouse_pos_changed = 5,
    rgfw_window_moved = 6,
    rgfw_window_resized = 7,
    rgfw_focus_in = 8,
    rgfw_focus_out = 9,
    rgfw_mouse_enter = 10,
    rgfw_mouse_leave = 11,
    rgfw_window_refresh = 12,
    rgfw_quit = 13,
    rgfw_dnd = 14,
    rgfw_dnd_init = 15,
    rgfw_window_maximized = 16,
    rgfw_window_minimized = 17,
    rgfw_window_restored = 18,
    rgfw_scale_updated = 19,
};

/// @brief No brief description was provided by RGFW.
///
/// @remarks The original name for this enum in RGFW is `RGFW_format`.
///
/// @see [The RGFW Docs](https://colleagueriley.github.io/RGFW/docs/structRGFW__format.html)
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

/// @brief No brief description was provided by RGFW.
///
/// @remarks The original name for this enum in RGFW is `RGFW_image`.
///
/// @see [The RGFW Docs](https://colleagueriley.github.io/RGFW/docs/structRGFW__image.html)
pub const RgfwImage = extern struct {
    /// @brief Raw image data
    data: *u8,
    /// @brief Image size
    size: RgfwArea,
    /// @brief Image format
    format: RgfwFormat,
};

/// @brief Key codes and mouse icon enums
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
    rgfw_end,
    rgfw_home,
    rgfw_page_up,
    rgfw_page_down,
    rgfw_num_lock,
    rgfw_kp_slash,
    rgfw_multiply,
    rgfw_kp_minus,
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
    rgfw_key_last,
};

/// @brief For `RgfwEvent.lock_state`
pub const RgfwKeyMod = enum(u8) {
    rgfw_mod_caps_lock = 0,
    rgfw_mod_num_lock = 1,
    rgfw_mod_control = 2,
    rgfw_mod_alt = 3,
    rgfw_mod_shift = 4,
    rgfw_mod_super = 5,
    rgfw_mod_scroll_lock = 6,
};

/// @brief Loads mouse icon from bitmap (similar to RGFW_window_setIcon).
///
/// @warning Icon NOT resized by default
///
/// @remarks The original name for this type in RGFW is `RGFW_mouse`.
///
/// @see [The RGFW Docs](https://colleagueriley.github.io/RGFW/docs/RGFW_8h.html#a7c3c77eb6844d3bb20054dc4f1f61ac5)
pub const RgfwMouse = opaque {};

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
    rgfw_mouse_final = 10,
};

/// @brief Basic vector type, if there's not already a point/vector type of choice.
pub const RgfwPoint = extern struct {
    x: i32,
    y: i32,
};

/// @brief Basic rect type, if there's not already a rect type of choice.
pub const RgfwRect = extern struct {
    x: i32,
    y: i32,
    w: i32,
    h: i32,
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
    _key_mod: RgfwKeyMod,
    /// @brief Windows flags (for RGFW to check)
    ///
    /// @todo I should turn this into a packed struct at some point for better Zig DX
    _flags: u32,
    /// @brief Rect before fullscreen
    _old_rect: RgfwRect,
};

/// @brief Optional arguments for making a windows
///
/// @todo I should turn this into a packed struct at some point for better Zig DX
pub const RgfwWindowFlags = enum(u32) {
    rgfw_window_no_init_api = 0,
    rgfw_window_no_border = 1,
    rgfw_window_no_resize = 2,
    rgfw_window_allow_dnd = 3,
    rgfw_window_hide_mouse = 4,
    rgfw_window_fullscreen = 5,
    rgfw_window_transparent = 6,
    rgfw_window_center = 7,
    rgfw_window_open_gl_software = 8,
    rgfw_window_cocoa_ch_dir_to_res = 9,
    rgfw_window_scale_to_monitor = 10,
    rgfw_window_hide = 11,
    rgfw_window_maximize = 12,
    rgfw_window_center_cursor = 13,
    rgfw_window_floating = 14,
    rgfw_window_focus_on_show = 15,
    rgfw_window_minimize = 16,
    rgfw_window_focus = 17,
    rgfw_window_use_egl = 18,
};

/// @brief src window data
pub const RgfwWindowSrc = switch (builtin.os.tag) {
    .macos => extern struct {
        window: *anyopaque,
        view: *anyopaque,
    },
    .windows => extern struct {
        window: *anyopaque,
        hdc: *anyopaque,
        offset: RgfwArea,
        h_icon_small: *anyopaque,
        h_icon_big: *anyopaque,
        max_size: RgfwArea,
        min_size: RgfwArea,
        aspect_ration: RgfwArea,
    },
    else => unreachable,
};
