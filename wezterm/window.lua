local wezterm = require("wezterm") --[[@as Wezterm]]
local CONSTANTS = require("constants")
local M = {}

---@param config Config
function M.setup(config)
	config.window_background_opacity = CONSTANTS.window_opacity

	config.default_cursor_style = "BlinkingBar"
	config.adjust_window_size_when_changing_font_size = false
	config.debug_key_events = false
	config.hide_tab_bar_if_only_one_tab = true
	config.tab_bar_at_bottom = true
	config.use_fancy_tab_bar = false
	config.window_close_confirmation = "NeverPrompt"
	config.window_decorations = "RESIZE"

	-- macOS
	if wezterm.target_triple == "aarch64-apple-darwin" then
		-- we are running on windows; maybe we emit different
		-- key assignments here?
		config.macos_window_background_blur = 20
		config.native_macos_fullscreen_mode = false
	end

	-- Command Palette
	local scheme = wezterm.color.get_builtin_schemes()["Catppuccin Mocha"]
	config.command_palette_bg_color = scheme.background
	config.command_palette_fg_color = scheme.foreground
end

return M
