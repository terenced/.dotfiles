local wezterm = require("wezterm") --[[@as Wezterm]]
local M = {}

---@param config Config
function M.setup(config)
	local font = wezterm.font_with_fallback({
		-- { family = "SpaceMono Nerd Font", weight = "Bold", italic = false },
		{ family = "JetBrainsMono Nerd Font Mono", weight = "Bold", italic = false },
	})

	config.font = font
	config.font_size = 14.0
	config.command_palette_font_size = 18.0
end

return M
