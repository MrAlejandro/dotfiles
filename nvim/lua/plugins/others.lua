return {
  { "mfussenegger/nvim-dap" },
  { "RRethy/nvim-treesitter-endwise" },
  {
    "smjonas/inc-rename.nvim",
    opts = {},
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end,
  },
}
