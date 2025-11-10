return {
  -- Enable conform.nvim for formatting
  {
    "stevearc/conform.nvim",
    -- event = { "BufWritePre" },
    -- cmd = { "ConformInfo" },
    -- init = function()
    --   vim.o.formatexpr = [[v:lua.require("conform").formatexpr()]]
    -- end,
    opts = {
      formatters_by_ft = {
        javascript = { "eslint_d" },
        javascriptreact = { "eslint_d" },
        typescript = { "eslint_d" },
        typescriptreact = { "eslint_d" },
        -- keep existing ones
        lua = { "stylua" },
        ruby = { "rubocop" },
      },
      -- format_on_save = {
      --   lsp_fallback = true,
      --   timeout_ms = 500,
      -- },
      log_level = vim.log.levels.DEBUG,
      -- Format on save
      -- format_on_save = {
      --   lsp_fallback = true,
      --   -- lsp_format = "fallback",
      --   timeout_ms = 500,
      -- },

      -- Formatters by filetype
      -- formatters_by_ft = {
      --   ruby = { "rubocop" }, -- use rubocop as the formatter for Ruby
      -- },

      -- Optional: Custom formatter configuration
      -- formatters = {
      --   rubocop = {
      --     command = "bundle",
      --     -- args = { "exec", "rubocop", "--debug", "--autocorrect", "--stderr", "--stdin", "$FILENAME" },
      --     args = { "exec", "rubocop", "--autocorrect", "$FILENAME" },
      --     stdin = false,
      --   },
      -- },
      -- formatters = {
      --   eslint_local = {
      --     command = "eslint_d",
      --     args = {
      --       "--fix",
      --       function()
      --         return vim.api.nvim_buf_get_name(0)
      --       end,
      --     },
      --     stdin = false,
      --     cwd = function()
      --       -- run eslint_d from client/src so it picks up the local config there
      --       return vim.fn.getcwd() .. "/client/src"
      --     end,
      --     env = { NODE_PATH = vim.fn.getcwd() .. "/node_modules" },
      --   },
      -- },
    },
  },
}
