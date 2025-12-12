local wezterm = require("wezterm") --[[@as Wezterm]]
local act = wezterm.action

local M = {}

---@param config Config
function M.setup(config)
	-- config.disable_default_key_bindings = true
	config.keys = {
		-- Open WezTerm config file quickly
		{ key = "p", mods = "CMD|SHIFT", action = act.ActivateCommandPalette },
		{ key = "u", mods = "CMD", action = act.EmitEvent("toggle-opacity") },
	}
end

return M
