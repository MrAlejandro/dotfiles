return {
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "ravitemer/mcphub.nvim",
    },
    opts = {
      strategies = {
        chat = {
          adapter = "ollama",
          model = "qwen3-coder:30b",
        },
        inline = {
          adapter = "ollama",
          model = "qwen3-coder:30b",
        },
        cmd = {
          adapter = "ollama",
          model = "qwen3-coder:30b",
        },
      },
      prompt_header = [[
        You are an expert Ruby on Rails and React (TypeScript) developer.
        Always output clean, idiomatic, production-ready code and concise explanations.
      ]],
      -- opts = {
      --   log_level = "DEBUG",
      -- },
    },
  },
}
