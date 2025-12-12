local wezterm = require("wezterm") --[[@as Wezterm]]
local M = {}

---@param config Config
function M.setup(config)
	local font = wezterm.font("SpaceMono Nerd Font", { weight = "Bold", italic = false })
	-- local font = wezterm.font("MonaspiceNe Nerd Font Mono", { weight = "Bold", italic = false })
	-- config.font = wezterm.font("CommitMono Nerd Font Mono", { weight = "Bold", italic = false })
	-- config.font = wezterm.font("JetBrainsMono Nerd Font Mono", { weight = "Bold", italic = false })
	-- config.font = wezterm.font("GeistCode Nerd Font Mono", { weight = "Bold", italic = false })

	config.font = font
	config.font_size = 11.0
	-- config.command_palette_font = font
	-- config.command_palette_font_size = 12.0
end

return M
