---@type Wezterm
local wezterm = require("wezterm") --[[@as Wezterm]]
local M = {}

---@param config Config
function M.setup(config)
	local font = wezterm.font_with_fallback({
		{ family = "SpaceMono Nerd Font Mono", weight = "Regular", italic = false },
		{ family = "Anonymous Pro", weight = "DemiBold", italic = false },
		{ family = "BlexMono Nerd Font Mono", weight = "DemiBold" },
		{ family = "Hack Nerd Font Mono", weight = "DemiBold", italic = false },
		{ family = "Hurmit Nerd Font Mono", weight = "DemiBold", italic = false },
		{ family = "JetBrainsMono Nerd Font Mono", weight = "DemiBold", italic = false },
		{ family = "Source Code Pro", weight = "DemiBold" },
	})

	config.font = font
	config.font_size = 13.0
	config.command_palette_font_size = 18.0
end

return M
