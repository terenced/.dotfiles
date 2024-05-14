--
-- ██╗    ██╗███████╗███████╗████████╗███████╗██████╗ ███╗   ███╗
-- ██║    ██║██╔════╝╚══███╔╝╚══██╔══╝██╔════╝██╔══██╗████╗ ████║
-- ██║ █╗ ██║█████╗    ███╔╝    ██║   █████╗  ██████╔╝██╔████╔██║
-- ██║███╗██║██╔══╝   ███╔╝     ██║   ██╔══╝  ██╔══██╗██║╚██╔╝██║
-- ╚███╔███╔╝███████╗███████╗   ██║   ███████╗██║  ██║██║ ╚═╝ ██║
--  ╚══╝╚══╝ ╚══════╝╚══════╝   ╚═╝   ╚══════╝╚═╝  ╚═╝╚═╝     ╚═╝
-- A GPU-accelerated cross-platform terminal emulator
-- https://wezfurlong.org/wezterm/
--
-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.color_scheme = "Catppuccin Frappe"

-- config.font = wezterm.font("MonaspiceNe Nerd Font Mono", { weight = "Bold", italic = false })
config.font = wezterm.font("CommitMono Nerd Font Mono", { weight = "Bold", italic = false })
config.font_size = 16.0

config.adjust_window_size_when_changing_font_size = false
config.debug_key_events = false
config.native_macos_fullscreen_mode = false
config.window_decorations = "RESIZE"
config.tab_bar_at_bottom = true
config.window_background_opacity = 0.80
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true

-- keys
config.keys = {
	-- Open WezTerm config file quickly
}
return config
