local application = require "mjolnir.application"
local hotkey = require "mjolnir.hotkey"
local window = require "mjolnir.window"
local fnutils = require "mjolnir.fnutils"

-- Position the current window in the bottom-right corner
hotkey.bind({"cmd", "alt", "ctrl"}, "down", function()
    local win = window.focusedwindow()
    local f = win:frame()

    -- Screen of the currently focused window
    local screen = win:screen()
    local screenFrame = screen:frame()

    -- Bottom right corner of the current screen
    local bottomRight = {
        x = screenFrame.x  + screenFrame.w,
        y = screenFrame.y + screenFrame.h
    }

    -- Position the current window in the bottom right corner of the screen
    f.x = bottomRight.x - f.w
    f.y = bottomRight.y - f.h
    win:setframe(f)

    -- mjolnir.openconsole();
end)

-- Move the current window up by a distance of the window height
hotkey.bind({"cmd", "alt", "ctrl"}, "up", function()
    local win = window.focusedwindow()
    local f = win:frame()

    f.y = f.y - f.h
    win:setframe(f)

    -- mjolnir.openconsole();
end)
