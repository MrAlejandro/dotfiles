return {
  -- Enable conform.nvim for formatting
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        javascript = { "eslint_d" },
        javascriptreact = { "eslint_d" },
        typescript = { "eslint_d" },
        typescriptreact = { "eslint_d" },
        lua = { "stylua" },
        ruby = { "rubocop" },
      },
      -- log_level = vim.log.levels.DEBUG,
    },
  },
}
