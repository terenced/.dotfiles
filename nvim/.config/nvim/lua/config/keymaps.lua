-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- Remove highlight
vim.api.nvim_set_keymap("n", "<C-d>", "<C-d>zz", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-u>", "<C-u>zz", { noremap = true })

-- Move Lines
vim.keymap.set("n", "<A-down>", ":m .+1<CR>==", { desc = "Move down" })
vim.keymap.set("v", "<A-down>", ":m '>+1<CR>gv=gv", { desc = "Move down" })
vim.keymap.set("i", "<A-down>", "<Esc>:m .+1<CR>==gi", { desc = "Move down" })
vim.keymap.set("n", "<A-up>", ":m .-2<CR>==", { desc = "Move up" })
vim.keymap.set("v", "<A-up>", ":m '<-2<CR>gv=gv", { desc = "Move up" })
vim.keymap.set("i", "<A-up>", "<Esc>:m .-2<CR>==gi", { desc = "Move up" })
vim.keymap.set("n", "<leader>ghb", "lua require 'gitsigns'.blame_line()", { desc = "Git Blame" })
vim.keymap.set("n", "<leader>sx", ":Telescope resume<CR>", { desc = "Telescope Resume" })
vim.keymap.set("n", "<leader>uz", ":ZenMode<CR>", { desc = "Toggle Zen Mode" })

-- Do not copy to clipboard on delete with 'x'
vim.keymap.set("n", "x", '"_x')

vim.keymap.set("n", "<CR>", "ciw")

-- Select all
vim.keymap.set("n", "<C-a>", "gg<S-v>G")
