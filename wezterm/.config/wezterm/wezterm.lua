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

local wezterm = require("wezterm") --[[@as Wezterm]]
local config = wezterm.config_builder() or {} --[[@as Config]]

require("colorscheme").apply_to_config(config)
require("events.toggle-opacity")
require("keys").setup(config)
require("font").setup(config)
require("window").setup(config)
require("tabs").setup(config)

-- TODO: Setup workspaces
-- local wsinit = wezterm.plugin.require("https://github.com/JuanraCM/wsinit.wezterm")
-- wsinit.apply_to_config(config)

return config
