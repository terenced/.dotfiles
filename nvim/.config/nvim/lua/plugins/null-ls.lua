return {
  -- {
  --   "jose-elias-alvarez/null-ls.nvim",
  --   opts = function()
  --     local nls = require("null-ls")
  --     return nls.register({ nls.builtins.formatting.prettier })
  --   end,
  -- },
  {
    "jayp0521/mason-null-ls.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "jose-elias-alvarez/null-ls.nvim",
    },
    after = "mason.nvim",
    config = function()
      require("mason-null-ls").setup({
        ensure_installed = {
          "stylua",
          "prettier",
        },
        automatic_installation = true,
        automatic_setup = true,
      })
    end,
  },
}
