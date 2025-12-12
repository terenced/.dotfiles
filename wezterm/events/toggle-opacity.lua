local wezterm = require("wezterm") --[[@as Wezterm]]

local CONSTANTS = require("constants")

local window_opacity = CONSTANTS.window_opacity
local window_no_opacity = 1

wezterm.on("toggle-opacity", function(window)
	local overrides = window:get_config_overrides() or {}
	if overrides.window_background_opacity == window_opacity then
		overrides.window_background_opacity = window_no_opacity
	else
		overrides.window_background_opacity = window_opacity
	end
	window:set_config_overrides(overrides)
end)
