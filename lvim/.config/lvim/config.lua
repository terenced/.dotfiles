-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
lvim.format_on_save = true
lvim.lint_on_save = true
lvim.colorscheme = "github"
lvim.transparent_window = false
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
}
-- if you just want to augment the existing ones then use the utility function
-- require("utils").add_keymap_insert_mode({ silent = true }, {
-- { "<C-s>", ":w<cr>" },
-- { "<C-c>", "<ESC>" },
-- })
-- you can also use the native vim way directly
-- vim.api.nvim_set_keymap("i", "<C-Space>", "compe#complete()", { noremap = true, silent = true, expr = true })

-- https://stackoverflow.com/questions/2895551/how-do-i-get-fine-grained-undo-in-vim
vim.api.nvim_set_keymap("i", "<Space>", "<Space><C-g>u", { noremap = true})
vim.api.nvim_set_keymap("i", "<Return>", "<Return><C-g>u", { noremap = true})
vim.api.nvim_set_keymap("i", "<Tab>", "<Tab><C-g>u", { noremap = true})

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.dashboard.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.active = true
lvim.builtin.nvimtree.side = "left"
lvim.builtin.nvimtree.show_icons.git = 1
lvim.builtin.nvimtree.hide_dotfiles = 0
lvim.builtin.nvimtree.auto_open = 1
lvim.builtin.nvimtree.highlight_opened_files = 1
lvim.builtin.nvimtree.auto_resize = 1
lvim.builtin.nvimtree.refresh_wait = 500

lvim.builtin.gitsigns.opts.current_line_blame = true
-- Use default mode (I like seeing the text of the modde I am in)
lvim.builtin.lualine.sections.lualine_a = {'mode'}
-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {}
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true
lvim.builtin.telescope.defaults.path_display = {}
lvim.builtin.telescope.defaults.layout_config.width = 0.85
-- generic LSP settings
-- you can set a custom on_attach function that will be used for all the language servers
-- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
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
      filetypes = { "javascript","javascriptreact", "typescript", "typescriptreact", "typescript.tsx" },
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
  {"mg979/vim-visual-multi"},
  {"christianchiarulli/nvcode-color-schemes.vim"},
  {"folke/zen-mode.nvim",
    config = function()
      require("zen-mode").setup {
        window = {
          width = .75 -- width will be 85% of the editor width
        }
      }
    end
  },
  {
    'frenzyexists/aquarium-vim',
    branch = 'vimscript_version'
  },
  {'wadackel/vim-dogrun'},
  {'projekt0n/github-nvim-theme',
    config = function ()
      -- https://awesomeopensource.com/project/projekt0n/github-nvim-theme
      require("github-theme").setup {
        comment_style = "italic",
        transparent = lvim.transparent_window
      }
    end
  },
  {
    'glepnir/indent-guides.nvim',
    config = function ()
      require("indent_guides").setup {}
    end
  },
  {
    'gelguy/wilder.nvim',
    requires ="nixprime/cpsm",
    config = function()
      vim.cmd([[
          source $HOME/.config/lvim/wilder.vim
      ]])
    end
  },
}
-- lvim.autocommands.custom_groups = {
--   { "BufWinEnter", "*.lua", "setlocal ts=8 sw=8" },
-- }

-- Additional Leader bindings for WhichKey
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>lua require'telescope'.extensions.project.project{}<CR>", "Projects" }
lvim.builtin.which_key.mappings["z"] = {"<cmd>:ZenMode<CR>", "Zen Mode"}
lvim.builtin.which_key.mappings["r"] = {"<cmd>:Telescope resume<CR>", "Resume"}
lvim.builtin.which_key.mappings.l["h"] = {"<cmd>lua vim.lsp.buf.hover()<CR>", "Hover"}
lvim.builtin.which_key.mappings.l["g"] = {
  name = "Go To",
  d = {"<cmd>lua vim.lsp.buf.definition()<CR>", "Definition"},
  D = {"<cmd>lua vim.lsp.buf.declaration()<CR>", "Declaration"},
  i = {"<cmd>lua vim.lsp.buf.implementation()<CR>", "Implementation"},
}

vim.cmd([[source $HOME/.vimrc]])

