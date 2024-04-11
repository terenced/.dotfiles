return {
  { "Mofiqul/dracula.nvim", lazy = false, priority = 1000 },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    opts = {
      flavour = "frappe",
    },
  },

  { "shaunsingh/nord.nvim", lazy = false, priority = 1000 },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
        lualine_bold = true,
      },
    },
  },
  { "EdenEast/nightfox.nvim" },
  { "nyoom-engineering/oxocarbon.nvim", name = " oxocarbon", lazy = false, priority = 1000 },
  { "olivercederborg/poimandres.nvim", name = "poimandres", lazy = false, priority = 1000 },
  { "craftzdog/solarized-osaka.nvim", lazy = false, priority = 1000, opts = {} },
  { "fffnite/gleam-theme-nvim", lazy = false, priority = 1000 },

  -- Configure LazyVim to load colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gleam",
      -- colorscheme = "tokyonight",
    },
  },
}
