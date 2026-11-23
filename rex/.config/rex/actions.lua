-- Custom actions, loaded from init.lua with require("actions").

local SHELL = "com.superlogical.terminal.shell"
local HOME = os.getenv("HOME")
local CODE = HOME .. "/code"

-- Open a new tab from a layout, make it active, focus its first pane, and ask
-- the app that ran the action to show it. Returns the new_window result.
-- `name` prefixes warnings in the Rex log.
local function open_tab(ctx, name, label, layout)
	local w, err = rex.session.new_window({
		window_label = label,
		focus = true,
		layout = layout,
	})
	if err ~= nil then
		error(err, 0)
	end

	local _, ferr = rex.session.focus_window({ window_id = w.window_id })
	if ferr ~= nil then
		rex.log("warn", name .. ": " .. ferr)
	end
	local block = w.block_ids and w.block_ids[1]
	if block ~= nil then
		local _, berr = rex.session.focus_block({ block_id = block })
		if berr ~= nil then
			rex.log("warn", name .. ": " .. berr)
		end
	end

	-- The server's focus does not move the app's view, so ask the app that
	-- ran the action to show the new tab. This runs after run() returns.
	--
	-- Wait briefly first: if session.select reaches the app before the app
	-- has the new tab, the app ignores it. rex.sleep is not available in the
	-- config file, and rex.exec does not block the server while it waits.
	rex.exec({ "sleep", "0.15" }, { timeout = 2 })
	local ok, qerr = pcall(rex.client.queue, "session.select", {
		session_id = ctx.session_id,
		window_id = w.window_id,
	})
	if not ok then
		rex.log("warn", name .. ": " .. tostring(qerr))
	end

	return w
end

-- Pick a project folder in ~/code and open it in a new tab.
rex.action({
	name = "open_project",
	title = "Open Project…",
	category = "Projects",
	keywords = "project code repo folder tab",
	run = function(ctx, args)
		local r, err = rex.exec(
			{ "find", CODE, "-mindepth", "1", "-maxdepth", "1", "-type", "d", "-not", "-name", ".*" },
			{ timeout = 5 }
		)
		if r == nil then
			error(err, 0)
		end
		if not r.ok then
			error(r.stderr, 0)
		end

		local dirs = {}
		for line in r.stdout:gmatch("[^\n]+") do
			dirs[#dirs + 1] = line
		end
		table.sort(dirs, function(a, b)
			return a:lower() < b:lower()
		end)

		local items = {}
		for _, dir in ipairs(dirs) do
			items[#items + 1] = {
				id = dir,
				title = dir:match("([^/]+)$"),
				subtitle = "~" .. dir:sub(#HOME + 1),
				icon = "folder",
			}
		end

		local dir = rex.ui.pick({
			title = "Open project",
			placeholder = "Filter projects",
			confirm = "Open in new tab",
			items = items,
		})
		if dir == nil then
			return
		end

		local w = open_tab(
			ctx,
			"open_project",
			dir:match("([^/]+)$"),
			rex.layout.block({ flavor = SHELL, options = { cwd = dir } })
		)
		return { window_id = w.window_id }
	end,
})

-- Open a tab with admin on the left and jane on the right, and start both.
rex.action({
	name = "jane_dev",
	title = "Start Admin + Jane",
	category = "Projects",
	keywords = "jane admin dev start overmind pnpm",
	run = function(ctx, args)
		local w = open_tab(
			ctx,
			"jane_dev",
			"admin + jane",
			rex.layout.horizontal(
				0.5,
				rex.layout.block({
					flavor = SHELL,
					options = {
						cwd = CODE .. "/admin-app-module-federation",
						initial_input = "pnpm start --filter=// --filter=assistants-remote\r",
					},
				}),
				rex.layout.block({
					flavor = SHELL,
					options = {
						cwd = CODE .. "/jane",
						initial_input = "jdc task start\r",
					},
				})
			)
		)
		return { window_id = w.window_id }
	end,
})
