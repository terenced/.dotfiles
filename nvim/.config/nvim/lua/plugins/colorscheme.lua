-- lazy = false, -- make sure we load this during startup if it is your main colorscheme
-- priority = 1000, -- make sure to load this before all the other start plugins
--
return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    opts = {
      flavour = "frappe",
      transparent_background = true,
    },
  },
  {
    "oskarnurm/koda.nvim",
    config = function()
      require("koda").setup({ transparent = true })
      -- vim.cmd("colorscheme koda")
    end,
  },
  { "Mofiqul/dracula.nvim" },
  { "shaunsingh/nord.nvim" },
  {
    "folke/tokyonight.nvim",
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
  { "nyoom-engineering/oxocarbon.nvim", name = " oxocarbon" },
  { "olivercederborg/poimandres.nvim", name = "poimandres" },
  { "craftzdog/solarized-osaka.nvim" },
  { "fffnite/gleam-theme-nvim" },

  -- Configure LazyVim to load colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "koda",
      -- colorscheme = "catppuccin-frappe",
      -- colorscheme = "tokyonight",
    },
  },
}
