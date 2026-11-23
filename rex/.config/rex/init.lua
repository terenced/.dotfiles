-- Migrated from ~/.tmux.conf (prefix ctrl+space) and Ghostty config.

-- Prefix passthrough: ctrl+space twice sends ctrl+space to the program.
rex.bind("ctrl+space>ctrl+space", "pane.send_key", { key = "ctrl+space" })

-- ~/.tmux.conf:15
rex.bind("ctrl+space>r", "client.config.reload")
-- ~/.tmux.conf:22
rex.bind("ctrl+space>\\", "pane.split", { direction = "right" })
-- ~/.tmux.conf:23
rex.bind("ctrl+space>shift+5", "pane.split", { direction = "right" })
-- ~/.tmux.conf:24
rex.bind("ctrl+space>-", "pane.split", { direction = "down" })
-- ~/.tmux.conf:25
rex.bind("ctrl+space>'", "pane.split", { direction = "down" })
-- ~/.tmux.conf:46
rex.bind("ctrl+space>x", "pane.close")

rex.bind("cmd+u", "client.setting.interface.appearance.style")

-- Custom actions (actions.lua) --------------------------------------------
require("actions")

rex.bind("ctrl+space>p", "open_project")
rex.bind("ctrl+space>j", "jane_dev")
