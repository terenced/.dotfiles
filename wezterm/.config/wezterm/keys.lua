local wezterm = require("wezterm") --[[@as Wezterm]]
local act = wezterm.action

local M = {}

local function move_pane(key, direction)
	return {
		key = key,
		mods = "LEADER",
		action = wezterm.action.ActivatePaneDirection(direction),
	}
end

local function resize_pane(key, direction)
	return {
		key = key,
		action = wezterm.action.AdjustPaneSize({ direction, 3 }),
	}
end

---@param config Config
function M.setup(config)
	-- config.disable_default_key_bindings = true
	config.leader = { key = " ", mods = "CTRL", timeout_milliseconds = 1000 }
	config.keys = {
		{
			key = ",",
			mods = "CMD",
			action = wezterm.action.SpawnCommandInNewTab({
				cwd = os.getenv("WEZTERM_CONFIG_DIR"),
				args = {
					os.getenv("SHELL"),
					"-l",
					"-c",
					"nvim",
					os.getenv("WEZTERM_CONFIG_FILE"),
				},
			}),
		},
		-- Open WezTerm config file quickly
		{ key = "p", mods = "CMD|SHIFT", action = act.ActivateCommandPalette },
		{ key = "u", mods = "CMD", action = act.EmitEvent("toggle-opacity") },
		{ key = "w", mods = "CMD", action = act.CloseCurrentPane({ confirm = true }) },

		{ key = "c", mods = "LEADER", action = act.SpawnTab("CurrentPaneDomain") },

		-- Pane Picker
		{ key = "p", mods = "LEADER", action = act.PaneSelect({ alphabet = "1234567890", mode = "Activate" }) },

		-- Tab Picker
		{ key = "t", mods = "LEADER", action = act.ShowLauncherArgs({ flags = "FUZZY|TABS" }) },

		-- Workspace Picker
		{ key = "w", mods = "LEADER", action = act.ShowLauncherArgs({ flags = "FUZZY|WORKSPACES" }) },
		{ key = "l", mods = "LEADER|CTRL", action = wezterm.action.ShowLauncher },

		-- Tab nav
		{ key = "p", mods = "LEADER", action = act.ActivateTabRelative(-1) },
		{ key = "n", mods = "LEADER", action = act.ActivateTabRelative(1) },
		{ key = "1", mods = "LEADER", action = act.ActivateTab(0) },
		{ key = "2", mods = "LEADER", action = act.ActivateTab(1) },
		{ key = "3", mods = "LEADER", action = act.ActivateTab(2) },
		{ key = "4", mods = "LEADER", action = act.ActivateTab(3) },
		{ key = "5", mods = "LEADER", action = act.ActivateTab(4) },
		{ key = "6", mods = "LEADER", action = act.ActivateTab(5) },
		{ key = "7", mods = "LEADER", action = act.ActivateTab(6) },
		{ key = "8", mods = "LEADER", action = act.ActivateTab(7) },
		{ key = "9", mods = "LEADER", action = act.ActivateTab(8) },
		{ key = "b", mods = "LEADER", action = act.RotatePanes("Clockwise") },

		-- Copy mode
		{
			key = "[",
			mods = "LEADER",
			action = "ActivateCopyMode",
		},

		-- Multiplexing
		{
			key = "'",
			mods = "LEADER",
			action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
		},
		{
			key = "-",
			mods = "LEADER",
			action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
		},
		{
			key = "z",
			mods = "LEADER",
			action = wezterm.action.TogglePaneZoomState,
		},
		{ key = "s", mods = "LEADER", action = wezterm.action.QuickSelect },
		move_pane("j", "Down"),
		move_pane("k", "Up"),
		move_pane("h", "Left"),
		move_pane("l", "Right"),
		move_pane("DownArrow", "Down"),
		move_pane("UpArrow", "Up"),
		move_pane("LeftArrow", "Left"),
		move_pane("RightArrow", "Right"),
		{
			-- When we push LEADER + R...
			key = "r",
			mods = "LEADER",
			-- Activate the `resize_panes` keytable
			action = wezterm.action.ActivateKeyTable({
				name = "resize_panes",
				-- Ensures the keytable stays active after it handles its
				-- first keypress.
				one_shot = false,
				-- Deactivate the keytable after a timeout.
				timeout_milliseconds = 1000,
			}),
		},
	}
	config.key_tables = {
		resize_panes = {
			resize_pane("j", "Down"),
			resize_pane("k", "Up"),
			resize_pane("h", "Left"),
			resize_pane("l", "Right"),
			resize_pane("DownArrow", "Down"),
			resize_pane("UpArrow", "Up"),
			resize_pane("LeftArrow", "Left"),
			resize_pane("RightArrow", "Right"),
			{ key = "Escape", action = "PopKeyTable" },
		},
	}
end

return M
