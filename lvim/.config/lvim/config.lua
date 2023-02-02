-- general
lvim.format_on_save = true
lvim.lint_on_save = true
lvim.colorscheme = "catppuccin"
lvim.transparent_window = false
lvim.reload_config_on_save = true
-- keymappings
lvim.leader = "space"
-- overwrite the key-mappings provided by LunarVim for any mode, or leave it empty to keep them
lvim.keys.normal_mode = {
  --   Page down/up
  --   {'[d', '<PageUp>'},
  --   {']d', '<PageDown>'},
  --
  --   Navigate buffers
  ["<Tab>"] = ":bnext<CR>",
  ["<S-Tab>"] = "bprevious<CR>",
  -- Better window movement
  ["<C-Left>"] = "<C-w>h",
  ["<C-Down>"] = "<C-w>j",
  ["<C-Up>"] = "<C-w>k",
  ["<C-Right>"] = "<C-w>l",
}
-- if you just want to augment the existing ones then use the utility function
-- require("utils").add_keymap_insert_mode({ silent = true }, {
-- { "<C-s>", ":w<cr>" },
-- { "<C-c>", "<ESC>" },
-- })
-- you can also use the native vim way directly
-- vim.api.nvim_set_keymap("i", "<C-Space>", "compe#complete()", { noremap = true, silent = true, expr = true })

-- https://stackoverflow.com/questions/2895551/how-do-i-get-fine-grained-undo-in-vim
vim.api.nvim_set_keymap("i", "<Space>", "<Space><C-g>u", { noremap = true })
vim.api.nvim_set_keymap("i", "<Return>", "<Return><C-g>u", { noremap = true })
vim.api.nvim_set_keymap("i", "<Tab>", "<Tab><C-g>u", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-d>", "<C-d>zz", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-u>", "<C-u>zz", { noremap = true })
vim.opt.timeoutlen = 150
-- :set number relativenumber
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.foldmethod = 'syntax'

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.dashboard.section.header.val = {
  [[                               __                ]],
  [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
  [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
  [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
  [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
  [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
}
lvim.builtin.alpha.active = true
lvim.builtin.terminal.active = true
lvim.builtin.terminal.open_mapping = [[<c-t>]]
lvim.builtin.nvimtree.active = true
lvim.builtin.nvimtree.side = "left"
-- lvim.builtin.nvimtree.show_icons.git = 1
lvim.builtin.nvimtree.hide_dotfiles = 0
-- lvim.builtin.nvimtree.auto_open = true
lvim.builtin.nvimtree.highlight_opened_files = 1
-- lvim.builtin.nvimtree.auto_resize = true
lvim.builtin.nvimtree.refresh_wait = 300

-- lvim.builtin.gitsigns.opts.current_line_blame = true
-- Use default mode (I like seeing the text of the modde I am in)
lvim.builtin.lualine.sections.lualine_a = { 'mode' }
-- lvim.builtin.lualine.options.theme = 'tokyonight'
-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {}
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true
-- lvim.builtin.telescope.defaults.path_display = {}

-- https://github.com/LunarVim/LunarVim/issues/3406
lvim.builtin.telescope.defaults.layout_strategy = "flex"
lvim.builtin.telescope.pickers.find_files = {
  layout_config = { width = 0.80, height = 0.80, preview_width = nil, prompt_position = "top" }
}
lvim.builtin.telescope.pickers.live_grep = {
  layout_config = { height = 0.99, width = 0.99, preview_cutoff = 120, preview_width = 0.6, prompt_position = "top" },
}
lvim.builtin.telescope.pickers.git_files = {
  layout_strategy = "flex",
}
lvim.builtin.telescope.pickers.diagnostics = {
  layout_strategy = "horizontal",
  theme = "dropdown",
  initial_mode = "normal",
  layout_config = { height = 0.99, width = 0.99, preview_cutoff = 120, preview_width = 0.6, },

}

lvim.builtin.gitsigns.opts.current_line_blame = true
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  {
    exe = "prettier",
    filetypes = {
      "javascriptreact",
      "javascript",
      "typescriptreact",
      "typescript",
      "json",
      "markdown",
    },
  },
}

-- lvim.builtin.telescope.defaults.layout_config.width = 0.85
-- generic LSP settings
-- you can set a custom on_attach function that will be used for all the language servers
-- See <https://github.com/neovim/nvim-Lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end



local isDeno = require("lspconfig/util").root_pattern("import_map.json")
if isDeno() then
  lvim.lang.typescript.lsp = {
    provider = "denols",
    setup = {
      cmd = {
        DATA_PATH .. "/lspinstall/deno/bin/deno",
        "lsp",
      },
      filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "typescript.tsx" },
      init_options = {
        enable = true,
        lint = false,
        unstable = false,
        importMap = './import_map.json',
      },
      root_dir = require("lspconfig").util.root_pattern("mod.ts", ".git"),
    },
  }
end

-- Additional Plugins
-- lvim.plugins = {
--     {"folke/tokyonight.nvim"}, {
--         "ray-x/lsp_signature.nvim",
--         config = function() require"lsp_signature".on_attach() end,
--         event = "InsertEnter"
--     }
-- }
lvim.plugins = {
  { "mg979/vim-visual-multi" },
  { "christianchiarulli/nvcode-color-schemes.vim" },
  { "folke/zen-mode.nvim",
    config = function()
      require("zen-mode").setup {
        window = {
          width = .75 -- width will be 85% of the editor width
        }
      }
    end
  },
  {
    'glepnir/indent-guides.nvim',
    config = function()
      require("indent_guides").setup {}
    end
  },
  {
    'gelguy/wilder.nvim',
    requires = "nixprime/cpsm",
    config = function()
      vim.cmd([[
          source $HOME/.config/lvim/wilder.vim
      ]])
    end
  },
  { 'folke/tokyonight.nvim' },
  { 'godlygeek/tabular' },
  { 'rmehri01/onenord.nvim' },
  -- {
  --   'blackCauldron7/surround.nvim',
  --   config = function()
  --     require("surround").setup {
  --       context_offset = 100,
  --       load_autogroups = false,
  --       mappings_style = "sandwich",
  --       map_insert_mode = true,
  --       quotes = { "'", '"' },
  --       brackets = { "(", '{', '[' },
  --       pairs = {
  --         nestable = { { "(", ")" }, { "[", "]" }, { "{", "}" } },
  --         linear = { { "'", "'" }, { "`", "`" }, { '"', '"' } }
  --       },
  --       prefix = "s"
  --     }
  --   end
  -- },
  { 'srcery-colors/srcery-vim' },
  { 'challenger-deep-theme/vim' },
  { 'wadackel/vim-dogrun' },
  { 'liuchengxu/space-vim-theme' },
  { "catppuccin/nvim", as = "catppuccin" },
  { 'mizlan/iswap.nvim' },
  { 'hachy/eva01.vim', as = "eva01" },
  { 'elvessousa/sobrio' },
  { 'Rigellute/shades-of-purple.vim' }
}
-- lvim.autocommands.custom_groups = {
--   { "BufWinEnter", "*.lua", "setlocal ts=8 sw=8" },
-- }

-- Additional Leader bindings for WhichKey
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>lua require'telescope'.extensions.project.project{}<CR>", "Projects" }
lvim.builtin.which_key.mappings["z"] = { "<cmd>:ZenMode<CR>", "Zen Mode" }
lvim.builtin.which_key.mappings["r"] = { "<cmd>:Telescope resume<CR>", "Resume" }
lvim.builtin.which_key.mappings.l["h"] = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Hover" }
lvim.builtin.which_key.mappings.l["g"] = {
  name = "Go To",
  d = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Definition" },
  D = { "<cmd>lua vim.lsp.buf.declaration()<CR>", "Declaration" },
  i = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "Implementation" },
}
vim.cmd([[source $HOME/.vimrc]])
vim.o.cursorcolumn = true
