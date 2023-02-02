return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "shellcheck",
        "black",
        "eslint_d",
        "prettier",
      },
    },
  },
}
