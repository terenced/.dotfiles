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

  --Lazy ones
  { "bluz71/vim-nightfly-colors", name = "nightfly", lazy = true, priority = 1000 },
  { "shaunsingh/nord.nvim", lazy = true, priority = 1000 },
  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = {
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },
  { "EdenEast/nightfox.nvim", lazy = true },
  { "nyoom-engineering/oxocarbon.nvim", name = " oxocarbon", lazy = true },
  { "olivercederborg/poimandres.nvim", name = "poimandres", lazy = true },
  { "JoosepAlviste/palenightfall.nvim", lazy = false },

  -- Configure LazyVim to load colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "tokyonight",
      colorscheme = "catppuccin-frappe",
    },
  },
}
