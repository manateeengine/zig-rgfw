pub fn rgfwSetClassName(name: []const u8) void {
    return RGFW_setClassName(name);
}

extern "rgfw" fn RGFW_setClassName(name: [*c]const u8) callconv(.c) void;
