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

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "make" },
  callback = function()
    print("Setting TAB")
    -- in makefiles, don't expand tabs to spaces, since actual tab characters are
    -- needed, and have indentation at 8 chars to be sure that all indents are tabs
    -- (despite the mappings later):
    vim.opt_local.expandtab = false
    vim.opt_local.shiftwidth = 4
    vim.opt_local.softtabstop = 0
    vim.opt_local.listchars:append("space:⋅")
  end,
})

vim.api.nvim_create_user_command("CopyPath", function()
  local path = vim.fn.expand("%:.")
  vim.fn.setreg("+", path)
end, {})

vim.api.nvim_create_user_command("CopyFullPath", function()
  local path = vim.fn.expand("%:p")
  vim.fn.setreg("+", path)
end, {})
