local wezterm = require("wezterm") --[[@as Wezterm]]
local M = {}

-- Based on
-- https://www.statox.fr/posts/2025/12/wezterm_neovim_synced_colorscheme/
-- https://github.com/statox/dotfiles/blob/98060bd83c124dd396885749ad79b831157c27d7/config/wezterm/colorscheme.lua
--
M.light_colorscheme = "Koda Light"
M.dark_colorscheme = "Koda Dark"
M.default_colorscheme_mode = "light"
M.colorscheme_file_path = "/tmp/colormode"

function M.create_colorscheme_file()
	local file = io.open(M.colorscheme_file_path, "w")
	file:write(M.default_colorscheme_mode)
	file:close()
end

function M.read_colorscheme_file()
	local file = io.open(M.colorscheme_file_path, "r")
	local content = file:read()
	file:close()
	return content
end

function M.get_colorscheme()
	local success, content = pcall(M.read_colorscheme_file)

	if not success then
		wezterm.log_info("Could not read file content, using default")
		M.create_colorscheme_file()
		content = M.default_colorscheme_mode
	end

	if not (content == "light" or content == "dark") then
		wezterm.log_info("Invalid mode in file, using default", content)
		content = M.default_colorscheme_mode
	end

	if content == "light" then
		return M.light_colorscheme
	end

	return M.dark_colorscheme
end

---@param config Config
function M.apply_to_config(config)
	local koda_dark = require("koda_dark")
	local koda_light = require("koda_light")

	local cat_dark = wezterm.color.get_builtin_schemes()["Catppuccin Mocha"]
	cat_dark.background = "#000000"

	local cat_light = wezterm.color.get_builtin_schemes()["Catppuccin Latte"]
	cat_light.background = "#faf9f5" -- https://github.com/oskarnurm/koda.nvim/blob/main/lua/koda/palette/light.lua#L4C17-L4C24

	config.color_schemes = {
		["Koda Dark"] = koda_dark,
		["Koda Light"] = koda_light,
		["Catppuccin Dark"] = cat_dark,
		["Catppuccin Light"] = cat_light,
	}
	config.color_scheme = M.get_colorscheme()
end

function M.toggle_colorscheme(window, pane, config)
	local _, content = pcall(M.read_colorscheme_file)

	local new_value = content == "light" and "dark" or "light"
	local file = io.open(M.colorscheme_file_path, "w")
	if file then
		file:write(new_value)
		file:close()
	end

	wezterm.reload_configuration()
end
return M
