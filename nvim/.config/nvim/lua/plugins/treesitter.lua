return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        -- add tsx and treesitter
        ensure_installed = {
          "bash",
          "python-language-server",
          "tsx",
          "typescript",
        },
      })
    end,
  },
}
