-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

-- opt.foldmethod = "expr"
-- opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldlevel = 99
opt.iskeyword:append("-") -- consider string-string as whole word
opt.spell = true
opt.swapfile = false
opt.winbar = "%=%m %f"
