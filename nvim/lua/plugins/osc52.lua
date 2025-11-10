return {
  "ojroques/nvim-osc52",
  event = "VeryLazy",
  config = function()
    local osc52 = require("osc52")

    osc52.setup({
      max_length = 0,
      silent = false,
      trim = false,
      tmux_passthrough = true,
    })

    -- Автокопирование при любом yank
    local function copy()
      if vim.v.event.operator == "y" and vim.v.event.regname == "" then
        require("osc52").copy_register('"')
      end
    end

    vim.api.nvim_create_autocmd("TextYankPost", { callback = copy })

    -- Делаем OSC52 системным буфером (по желанию)
    vim.g.clipboard = {
      name = "osc52",
      copy = { ["+"] = osc52.copy, ["*"] = osc52.copy },
      paste = { ["+"] = osc52.paste, ["*"] = osc52.paste },
    }
  end,
}
