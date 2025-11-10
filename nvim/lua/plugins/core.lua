return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight",
    },
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = { style = "day" },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "ruby" } },
  },
  {
    "mason-org/mason.nvim",
    opts = { ensure_installed = { "erb-formatter", "erb-lint" } },
  },
  -- {
  --   "suketa/nvim-dap-ruby",
  --   ft = { "ruby" },
  --   dependencies = { "mfussenegger/nvim-dap" },
  --   config = function()
  --     local ok_dap, dap = pcall(require, "dap")
  --     local ok_ruby, dap_ruby = pcall(require, "dap-ruby")
  --
  --     if ok_dap and ok_ruby then
  --       dap_ruby.setup()
  --     else
  --       vim.notify("nvim-dap-ruby: dap not ready", vim.log.levels.WARN)
  --     end
  --   end,
  -- },
  {
    "olimorris/neotest-rspec",
  },
}
