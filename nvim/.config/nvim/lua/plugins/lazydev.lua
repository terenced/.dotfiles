return {
  "folke/lazydev.nvim",
  dependencies = {
    { "DrKJeff16/wezterm-types", lazy = true },
  },
  opts = {
    library = {
      -- Other library configs...
      { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      { path = "LazyVim", words = { "LazyVim" } },
      { path = "snacks.nvim", words = { "Snacks" } },
      { path = "lazy.nvim", words = { "LazyVim" } },
      { path = "wezterm-types", mods = { "wezterm" } },
      { path = "wezterm", mods = { "wezterm" } },
      { path = "~/dotfiles/wezterm/.config/wezterm", mods = { "wezterm" } },
      { path = "~/.config/wezterm", mods = { "wezterm" } },
    },
  },
}
