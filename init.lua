-- This path should be adjusted to where your mjolnir scripts are
package.path = '/Users/mark/dev/mjolnir/?.lua;' .. package.path

local application = require "mjolnir.application"
local hotkey = require "mjolnir.hotkey"
local window = require "mjolnir.window"
local fnutils = require "mjolnir.fnutils"
local mwin = require "mjolnir-win"
