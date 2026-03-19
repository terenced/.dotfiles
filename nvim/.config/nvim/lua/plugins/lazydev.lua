return {
  "folke/lazydev.nvim",
  dependencies = {
    { "DrKJeff16/wezterm-types", lazy = true },
  },
  opts_extend = { "library" },
  opts = {
    library = {
      -- Other library configs...
      { path = "wezterm-types", mods = { "wezterm" } },
      { path = "wezterm", mods = { "wezterm" } },
      { path = "~/dotfiles/wezterm/.config/wezterm", mods = { "wezterm" } },
      { path = "~/.config/wezterm", mods = { "wezterm" } },
      { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      { path = "LazyVim", words = { "LazyVim" } },
      { path = "snacks.nvim", words = { "Snacks" } },
      { path = "lazy.nvim", words = { "LazyVim" } },
    },
  },
}
