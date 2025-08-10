//! @brief Zig RGFW: Idiomatic Zig Bindings for RGFW.

const input = @import("input.zig");
const monitor = @import("monitor.zig");
const rgfw = @import("rgfw.zig");
const window_management = @import("window_management.zig");

pub const rgfwIsClicked = input.rgfwIsClicked;
pub const rgfwIsHeld = input.rgfwIsHeld;
pub const rgfwIsMouseHeld = input.rgfwIsMouseHeld;
pub const rgfwIsMousePressed = input.rgfwIsMousePressed;
pub const rgfwIsMouseReleased = input.rgfwIsMouseReleased;
pub const rgfwIsPressed = input.rgfwIsPressed;
pub const rgfwIsReleased = input.rgfwIsReleased;
pub const rgfwWasMousePressed = input.rgfwWasMousePressed;
pub const rgfwWasPressed = input.rgfwWasPressed;

pub const RgfwMonitor = monitor.RgfwMonitor;
pub const RgfwMonitorMode = monitor.RgfwMonitorMode;
pub const rgfwWindowGetMonitor = monitor.rgfwWindowGetMonitor;
pub const rgfwWindowScaleToMonitor = monitor.rgfwWindowScaleToMonitor;

pub const RgfwEvent = rgfw.RgfwEvent;
pub const RgfwWindowFlags = rgfw.RgfwWindowFlags;

pub const RgfwIcon = window_management.RgfwIcon;
pub const RgfwMouseIcons = window_management.RgfwMouseIcons;
pub const rgfwCreateWindow = window_management.rgfwCreateWindow;
pub const rgfwCreateWindowPtr = window_management.rgfwCreateWindowPtr;
pub const rgfwGetMousePoint = window_management.rgfwGetMousePoint;
pub const rgfwGetScreenSize = window_management.rgfwGetScreenSize;
pub const rgfwMoveToMacOsResourceDir = window_management.rgfwMoveToMacOsResourceDir;
pub const rgfwSetClassName = window_management.rgfwSetClassName;
pub const rgfwSetXInstName = window_management.rgfwSetXInstName;
pub const rgfwWindowAllowsDnd = window_management.rgfwWindowAllowsDnd;
pub const rgfwWindowBorderless = window_management.rgfwWindowBorderless;
pub const rgfwWindowCenter = window_management.rgfwWindowCenter;
pub const rgfwWindowCheckEvent = window_management.rgfwWindowCheckEvent;
pub const rgfwWindowCheckQueuedEvent = window_management.rgfwWindowCheckQueuedEvent;
pub const rgfwWindowClose = window_management.rgfwWindowClose;
pub const rgfwWindowFocus = window_management.rgfwWindowFocus;
pub const rgfwWindowGetMousePoint = window_management.rgfwWindowGetMousePoint;
pub const rgfwWindowHide = window_management.rgfwWindowHide;
pub const rgfwWindowHoldMouse = window_management.rgfwWindowHoldMouse;
pub const rgfwWindowIsFloating = window_management.rgfwWindowIsFloating;
pub const rgfwWindowIsHidden = window_management.rgfwWindowIsHidden;
pub const rgfwWindowIsInFocus = window_management.rgfwWindowIsInFocus;
pub const rgfwWindowIsMaximized = window_management.rgfwWindowIsMaximized;
pub const rgfwWindowIsMinimized = window_management.rgfwWindowIsMinimized;
pub const rgfwWindowIsMouseHeld = window_management.rgfwWindowIsMouseHeld;
pub const rgfwWindowIsMouseHidden = window_management.rgfwWindowIsMouseHidden;
pub const rgfwWindowMaximize = window_management.rgfwWindowMaximize;
pub const rgfwWindowMinimize = window_management.rgfwWindowMinimize;
pub const rgfwWindowMove = window_management.rgfwWindowMove;
pub const rgfwWindowMoveMouse = window_management.rgfwWindowMoveMouse;
pub const rgfwWindowMoveToMonitor = window_management.rgfwWindowMoveToMonitor;
pub const rgfwWindowRaise = window_management.rgfwWindowRaise;
pub const rgfwWindowResize = window_management.rgfwWindowResize;
pub const rgfwWindowRestore = window_management.rgfwWindowRestore;
pub const rgfwWindowSetAspectRatio = window_management.rgfwWindowSetAspectRatio;
pub const rgfwWindowSetBorder = window_management.rgfwWindowSetBorder;
pub const rgfwWindowSetDnd = window_management.rgfwWindowSetDnd;
pub const rgfwWindowSetFlags = window_management.rgfwWindowSetFlags;
pub const rgfwWindowSetFloating = window_management.rgfwWindowSetFloating;
pub const rgfwWindowSetFullscreen = window_management.rgfwWindowSetFullscreen;
pub const rgfwWindowSetIcon = window_management.rgfwWindowSetIcon;
pub const rgfwWindowSetIconEx = window_management.rgfwWindowSetIconEx;
pub const rgfwWindowSetMaxSize = window_management.rgfwWindowSetMaxSize;
pub const rgfwWindowSetMinSize = window_management.rgfwWindowSetMinSize;
pub const rgfwWindowSetMouse = window_management.rgfwWindowSetMouse;
pub const rgfwWindowSetMouseDefault = window_management.rgfwWindowSetMouseDefault;
pub const rgfwWindowSetMousePassthrough = window_management.rgfwWindowSetMousePassthrough;
pub const rgfwWindowSetMouseStandard = window_management.rgfwWindowSetMouseStandard;
pub const rgfwWindowSetName = window_management.rgfwWindowSetName;
pub const rgfwWindowSetOpacity = window_management.rgfwWindowSetOpacity;
pub const rgfwWindowSetShouldClose = window_management.rgfwWindowSetShouldClose;
pub const rgfwWindowShouldClose = window_management.rgfwWindowShouldClose;
pub const rgfwWindowShow = window_management.rgfwWindowShow;
pub const rgfwWindowShowMouse = window_management.rgfwWindowShowMouse;
pub const rgfwWindowUnholdMouse = window_management.rgfwWindowUnholdMouse;

// Root files need to import all files with tests inside of a test block otherwise tests won't run
test {
    _ = rgfw;
    _ = window_management;
}
