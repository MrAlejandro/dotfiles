-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local bind = vim.keymap.set
local opts = { silent = true, noremap = true }

-- -- for russian layout
bind("i", "<c-х>", "<C-[>", opts)
bind("n", "л", "gk", opts)
bind("n", "о", "gj", opts)
bind("i", "<C-г>", "<C-G>u<C-U>", opts)
bind("i", "<C-ц>", "<C-G>u<C-W>", opts)

-- bind("n", "[c", function()
--   require("treesitter-context").go_to_context()
-- end)

bind("n", "<leader>[", "<Cmd>call append(line('.') - 1, repeat([''], v:count1))<CR>", opts)
bind("n", "<leader>]", "<Cmd>call append(line('.'),     repeat([''], v:count1))<CR>", opts)

-- vim.keymap.set("n", "<leader>fj", ":Neotree reveal<CR>", {})
-- vim.keymap.set('n', '<leader>fa', ':Telescope telescope-alternate alternate_file<CR>', {})

bind("n", "<leader>o", "<cmd>:Other<CR>", opts)

vim.keymap.set("n", "<Tab>h", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
vim.keymap.set("n", "<Tab>l", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })

-- smjonas/inc-rename.nvim
vim.keymap.set("n", "<leader>rn", function()
  return ":IncRename " .. vim.fn.expand("<cword>")
end, { expr = true })

-- vim.keymap.set("v", "<leader>fg", function()
--   local text = vim.fn.getreg("v") -- get the last visual selection
--   require("telescope.builtin").live_grep({ default_text = text })
-- end, { noremap = true, silent = true, desc = "Grep visual selection" })
vim.keymap.set("v", "<leader>fg", function()
  -- Yank the selected text into register z
  vim.cmd('normal! "zy')

  -- Get the yanked text from register z and trim it
  local text = vim.fn.getreg("z"):gsub("\n", "")

  require("telescope.builtin").live_grep({
    default_text = text,
  })
end, { noremap = true, silent = true, desc = "Grep visual selection" })

vim.keymap.set("n", "<leader>ff", require("telescope.builtin").find_files, { desc = "Find Files" })
vim.keymap.set("n", "<leader>fa", function()
  require("telescope.builtin").find_files({
    no_ignore = true,
    hidden = true,
  })
end, { desc = "Find all files (incl ignored & hidden)" })
vim.keymap.set("n", "<leader>fg", require("telescope.builtin").live_grep, { desc = "Live Grep" })
vim.keymap.set("n", "<leader>fw", require("telescope.builtin").grep_string, { desc = "Grep Word Under Cursor" })
vim.keymap.set("n", "<leader>fr", require("telescope.builtin").resume, { desc = "Resume Last Search" })
vim.keymap.set("n", "<leader>fl", function()
  require("telescope.builtin").live_grep({
    additional_args = function()
      return { "--fixed-strings", "--hidden", "--no-ignore" }
    end,
  })
end, { desc = "Live Grep (Literal)" })

vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to Definition" })

local neotest = require("neotest")

vim.keymap.set("n", "<leader>tn", function()
  neotest.run.run() -- Run nearest test
end, { desc = "Run nearest test" })

vim.keymap.set("n", "<leader>tf", function()
  neotest.run.run(vim.fn.expand("%")) -- Run all tests in current file
end, { desc = "Run tests in file" })

vim.keymap.set("n", "<leader>ts", function()
  neotest.run.stop() -- Stop running tests
end, { desc = "Stop test run" })

vim.keymap.set("n", "<leader>to", function()
  neotest.summary.toggle() -- Toggle test summary window
end, { desc = "Toggle test summary" })

vim.keymap.set("n", "<leader>cp", function()
  local filepath = vim.fn.expand("%:p")
  local root = require("lazyvim.util").root.get()
  local relpath = filepath:sub(#root + 2)
  local line_number = vim.fn.line(".")
  local path_with_line = string.format("%s:%d", relpath, line_number)

  local ok, osc52 = pcall(require, "osc52")
  if ok then
    osc52.copy(path_with_line)
  else
    vim.fn.setreg("+", path_with_line)
  end
  print("Copied relative path: " .. path_with_line)
end, { desc = "Copy relative file path from project root" })

local gs = require("gitsigns")
vim.keymap.set("n", "gB", gs.blame, { desc = "Git Blame Line" })
vim.keymap.set("n", "gb", function()
  gs.blame_line({ full = true })
end, { desc = "Git Blame Line (Full)" })
vim.keymap.set("n", "gT", gs.toggle_current_line_blame, { desc = "Toggle Inline Git Blame" })

-- Toggle snake_case ↔ camelCase
vim.keymap.set("n", "<leader>ct", function()
  local word = vim.fn.expand("<cword>")

  local toggled
  if word:find("_") then
    -- snake_case → camelCase
    toggled = word:gsub("_%l", function(s)
      return s:sub(2):upper()
    end)
  else
    -- camelCase → snake_case
    toggled = word:gsub("(%u)", function(s)
      return "_" .. s:lower()
    end)
  end

  vim.cmd("normal! ciw" .. toggled)
  vim.notify("Converted: " .. word .. " → " .. toggled, vim.log.levels.INFO)
end, { desc = "Toggle snake_case ↔ camelCase" })

vim.keymap.set('n', '<leader>c', require('osc52').copy_operator, {expr = true})
vim.keymap.set('n', '<leader>cc', '<leader>c_', {remap = true})
vim.keymap.set('v', '<leader>c', require('osc52').copy_visual)

local map = vim.keymap.set
map("n", "<leader>ac", ":CodeCompanionChat<CR>", { desc = "AI Chat" })
map("v", "<leader>av", ":CodeCompanion<CR>", { desc = "AI Inline (visual)" })
map("n", "<leader>ai", ":CodeCompanion<CR>", { desc = "AI Inline" })
map("v", "<leader>aa", ":CodeCompanionChat Add<CR>", { desc = "AI Chat Add" })
map("n", "<leader>ax", ":CodeCompanionActions<CR>", { desc = "AI Actions Palette" })

-- vim.keymap.set({ "n", "v" }, "<C-a>", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })
-- vim.keymap.set({ "n", "v" }, "<LocalLeader>a", "<cmd>CodeCompanionChat Toggle<cr>", { noremap = true, silent = true })
-- vim.keymap.set("v", "ga", "<cmd>CodeCompanionChat Add<cr>", { noremap = true, silent = true })
-- vim.keymap.set({ "n", "v" }, "<leader>ax", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true, desc = "AI Actions Palette" })

-- vim.keymap.set({ "n", "v" }, "<leader>ai", "<cmd>CodeCompanion<cr>", { noremap = true, silent = true, desc = "AI Inline" })
-- vim.keymap.set({ "n", "v" }, "<leader>ac", "<cmd>CodeCompanionChat Toggle<cr>", { noremap = true, silent = true, desc = "AI Chat" })
-- vim.keymap.set("v", "ga", "<cmd>CodeCompanionChat Add<cr>", { noremap = true, silent = true, desc = 'Add to AI Chat' })

-- Expand 'cc' into 'CodeCompanion' in the command line
vim.cmd([[cab cc CodeCompanion]])
