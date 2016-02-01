local application = require "mjolnir.application"
local hotkey = require "mjolnir.hotkey"
local screen = require "mjolnir.screen"
local window = require "mjolnir.window"
local fnutils = require "mjolnir.fnutils"

hotkey.bind({"cmd", "alt", "ctrl"}, "left", function()
    local win = window.focusedwindow()
    local f = win:frame()

    local mainScreen = screen.mainscreen()
    local prevScreen = mainScreen:previous()
    local prevScreenFrame = prevScreen:frame()

    print(f.x, f.y)

    f.x = f.x - prevScreenFrame.x
    f.y = f.y - prevScreenFrame.y
    print(f.x, f.y)
    win:setframe(f)
end)

-- CMD-OPT-f full screen
hotkey.bind({"cmd", "alt"}, "f", function()
    local win = window.focusedwindow()

    -- Screen of the currently focused window
    local screen = win:screen()
    local screenFrame = screen:frame()

    win:setframe(screenFrame)
end)

-- CMD-OPT-left left half
hotkey.bind({"cmd", "alt"}, "left", function()
    local win = window.focusedwindow()
    local f = win:frame()

    -- Screen of the currently focused window
    local screen = win:screen()
    local screenFrame = screen:frame()

    f = screenFrame
    f.w = f.w / 2 - 1

    win:setframe(f)
end)

-- CMD-OPT-right right half
hotkey.bind({"cmd", "alt"}, "right", function()
    local win = window.focusedwindow()
    local f = win:frame()

    -- Screen of the currently focused window
    local screen = win:screen()
    local screenFrame = screen:frame()

    f = screenFrame
    f.w = f.w / 2
    f.x = f.x + f.w - 2

    win:setframe(f)
end)

-- CMD-CTRL-OPT-right next display
hotkey.bind({"cmd", "ctrl", "alt"}, "right", function()
end)

-- CMD-CTRL-OPT-left previous display
hotkey.bind({"cmd", "ctrl", "alt"}, "left", function()
end)

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
