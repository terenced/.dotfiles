local wezterm = require("wezterm") --[[@as Wezterm]]
local CONSTANTS = require("constants")
local M = {}

---@param config Config
function M.setup(config)
	config.window_background_opacity = CONSTANTS.window_opacity

	-- config.default_cursor_style = "BlinkingBar"
	config.adjust_window_size_when_changing_font_size = false
	config.debug_key_events = false
	config.hide_tab_bar_if_only_one_tab = true
	config.window_close_confirmation = "NeverPrompt"
	config.window_decorations = "RESIZE"
	config.window_padding = {
		left = 2,
		right = 2,
		top = 1,
		bottom = 0,
	}
	-- macOS
	if wezterm.target_triple == "aarch64-apple-darwin" then
		-- we are running on windows; maybe we emit different
		-- key assignments here?
		config.macos_window_background_blur = 20
		config.native_macos_fullscreen_mode = false
	end

	-- Command Palette
	local scheme = wezterm.color.get_builtin_schemes()["Catppuccin Frappe"]
	config.command_palette_bg_color = scheme.background
	config.command_palette_fg_color = scheme.foreground

	-- Tabs
	config.tab_bar_at_bottom = false
	config.use_fancy_tab_bar = false
	local nf = wezterm.nerdfonts

	local SPACE = " "
	local normal_key_icon = SPACE .. nf.md_alphabetical_variant .. SPACE
	local leader_key_icon = SPACE .. nf.md_keyboard_outline .. SPACE
	local ime_icon = SPACE .. nf.md_syllabary_hiragana .. SPACE

	local function key_state(window)
		if window:leader_is_active() then
			return leader_key_icon
		elseif window:composition_status() then
			return ime_icon
		else
			return normal_key_icon
		end
	end
	local tabline = wezterm.plugin.require("https://github.com/michaelbrusegard/tabline.wez")
	tabline.set_theme("Catppuccin Frappe")
	tabline.setup({
		options = {
			section_separators = {
				left = "",
				right = "",
			},
			component_separators = {
				left = "",
				right = "",
			},
			tab_separators = {
				left = "",
				right = "",
			},
		},
		sections = {
			tabline_a = {
				key_state,
			},
			tabline_b = {},
			tab_active = {
				{
					"process",
					max_length = 10, -- Max length before it is truncated
				},
			},
		},
	})
end

return M
