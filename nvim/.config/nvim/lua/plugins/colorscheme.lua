return {
  { "Mofiqul/dracula.nvim", lazy = false, priority = 1000 },
  { "bluz71/vim-nightfly-colors", name = "nightfly", lazy = false, priority = 1000 },
  -- { "sainnhe/sonokai", lazy = false, priority = 1000 },
  { "shaunsingh/nord.nvim", lazy = false, priority = 1000 },
  { "catppuccin/nvim", name = "catppuccin", lazy = false },
  { "folke/tokyonight.nvim", lazy = false },
  { "EdenEast/nightfox.nvim", lazy = false },
  { "rose-pine/neovim", name = "rose-pine", lazy = false },
  { "wadackel/vim-dogrun", name = "dogrun", lazy = false },
  { "nyoom-engineering/oxocarbon.nvim", name = " oxocarbon", lazy = false },
  { "olivercederborg/poimandres.nvim", name = "poimandres", lazy = false },
  { "JoosepAlviste/palenightfall.nvim", lazy = false },
  -- { "shaunsingh/nord.nvim", lazy = false, priority = 1000 },
  -- {
  --   "rose-pine/neovim",
  --   name = "rose-pine",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     require("rose-pine").setup()
  --   end,
  -- },
  --
  -- Configure LazyVim to load colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "dogrun",
      colorscheme = "catppuccin-frappe",
    },
  },
}
