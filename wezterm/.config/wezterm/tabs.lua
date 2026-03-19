local wezterm = require("wezterm") --[[@as Wezterm]]
local CONSTANTS = require("constants")
local colorscheme = require("colorscheme")

local M = {}

---@param config Config
function M.setup(config)
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
	local theme = config.color_schemes[colorscheme.get_colorscheme()]
	tabline.set_theme(theme)
	tabline.setup({
		options = {
			theme_overrides = {
				normal_mode = {
					a = { fg = theme.foreground, bg = theme.background },
					b = { fg = theme.foreground, bg = theme.background },
					c = { fg = theme.foreground, bg = theme.background },
					x = { fg = theme.foreground, bg = theme.background },
					y = { fg = theme.foreground, bg = theme.background },
					z = { fg = theme.foreground, bg = theme.background },
				},
				copy_mode = {
					a = { fg = theme.background, bg = theme.ansi[6] },
					b = { fg = theme.foreground, bg = theme.background },
					c = { fg = theme.foreground, bg = theme.background },
					x = { fg = theme.background, bg = theme.ansi[6] },
					y = { fg = theme.background, bg = theme.ansi[6] },
					z = { fg = theme.background, bg = theme.ansi[6] },
				},
				search_mode = {
					a = { fg = theme.background, bg = theme.ansi[7] },
					b = { fg = theme.foreground, bg = theme.background },
					c = { fg = theme.foreground, bg = theme.background },
					x = { fg = theme.background, bg = theme.ansi[7] },
					y = { fg = theme.background, bg = theme.ansi[7] },
					z = { fg = theme.background, bg = theme.ansi[7] },
				},
				tab = {
					active = { fg = theme.tab_bar.active_tab.fg_color, bg = theme.tab_bar.active_tab.bg_color },
					inactive = { fg = theme.tab_bar.inactive_tab.fg_color, bg = theme.tab_bar.inactive_tab.bg_color },
					inactive_hover = {
						fg = theme.tab_bar.inactive_tab_hover.fg_color,
						bg = theme.tab_bar.inactive_tab_hover.bg_color,
					},
				},
			},
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
			tabline_b = {}, -- remove workspace
			tabline_x = {}, -- remove ram/cpu
			tabline_y = { "datetime", "battery" }, -- tab_active = {
			tab_active = {
				{ "index" },
				{ "zoomed", padding = 0 },
				{ "process", padding = { left = 0, right = 1 } },
			},
		},
	})
	tabline.apply_to_config(config)
end

return M
