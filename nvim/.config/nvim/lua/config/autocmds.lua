-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua

-- Fix conceallevel for json files
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "yaml", "yml", "py", "toml" },
  callback = function()
    print("Setting SPACE")
    vim.opt_local.listchars:append("space:⋅")
  end,
})
