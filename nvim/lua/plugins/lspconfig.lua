local lspconfig = require("lspconfig")

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      -- log_level = vim.log.levels.DEBUG,
      -- setup = {
      --   ruby_lsp = function(_, opts)
      --     require("lspconfig").ruby_lsp.setup(opts)
      --     return true
      --   end,
      -- },
      -- inlay_hints = {
      --   enabled = true,
      -- },
      -- codelens = {
      --   enabled = false,
      -- },
      diagnostics = {
        --   -- underline = true,
        -- virtual_text = false,
        -- virtual_lines = { current_line = true },
        -- virtual_text = false,
        --   -- float = {
        --   --   border = "rounded",
        --   -- },
        -- virtual_text = true,
        -- virtual_text = false,
        -- float = { border = "single" },
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
        -- float = {
        --   source = "always",
        --   border = "single",
        -- },
      },
      servers = {
        tsp_server = {},
        sorbet = {
          cmd = { "bundle", "exec", "srb", "tc", "--lsp" },
          root_dir = require("lspconfig.util").root_pattern("sorbet/config", "Gemfile", ".git"),
        },
        cssls = {},
        -- rubocop = {},
        rubocop = {
          cmd = { "bundle", "exec", "rubocop", "--lsp", "--server" },
          filetypes = { "ruby" },
          root_dir = require("lspconfig").util.root_pattern("Gemfile", ".git", ".rubocop.yml"),
          init_options = {
            formatting = true,
          },
        },
        autotools_ls = {},
        docker_compose_language_service = {},
        oxlint = {},
        somesass_ls = {},
        ruby_lsp = {
          init_options = {
            addonSettings = {
              ["Ruby LSP Rails"] = {
                enablePendingMigrationsPrompt = false,
              },
            },
          },
        },
        -- cssls = {},
        -- https://github.com/Shopify/ruby-lsp/issues/2347
        -- ruby_lsp = {
        --   mason = false,
        --   cmd = { vim.fn.expand("~/.asdf/shims/ruby-lsp") },
        -- },
        -- kotlin_language_server = {},
        -- https://www.arthurkoziel.com/json-schemas-in-neovim/
        -- helm_ls = {},
        -- https://github.com/typescript-language-server/typescript-language-server/pull/218
        -- https://github.com/microsoft/TypeScript/issues/13270
        -- tsserver = {
        --   settings = {
        --     javascript = {
        --       inlayHints = {
        --         parameterNames = { enabled = "literals" },
        --         parameterTypes = { enabled = true },
        --         variableTypes = { enabled = true },
        --         propertyDeclarationTypes = { enabled = true },
        --         functionLikeReturnTypes = { enabled = true },
        --         enumMemberValues = { enabled = true },
        --       },
        --       typescript = {
        --         -- format = {
        --         --   indentSize = vim.o.shiftwidth,
        --         --   convertTabsToSpaces = vim.o.expandtab,
        --         --   tabSize = vim.o.tabstop,
        --         -- },
        --         updateImportsOnFileMove = {
        --           enabled = "always",
        --         },
        --         inlayHints = {
        --           parameterNames = { enabled = "literals" },
        --           parameterTypes = { enabled = true },
        --           variableTypes = { enabled = true },
        --           propertyDeclarationTypes = { enabled = true },
        --           functionLikeReturnTypes = { enabled = true },
        --           enumMemberValues = { enabled = true },
        --         },
        --         -- enables project wide error reporting similar to vscode
        --         -- tsserver = {
        --         --   experimental = {
        --         --     enableProjectDiagnostics = true,
        --         --   },
        --         -- },
        --       },
        --     },
        --     tsserver = {
        --       init_options = {
        --         preferences = {
        --           quoteStyle = "single",
        --         },
        --       },
        --     },
        --   },
        -- },
        -- html = {
        --   -- filetypes = { "html", "blade" },
        -- },
        -- bashls = {},
        -- lemminx = {},
        ltex = {
          settings = {
            ltex = {
              language = "ru-RU",
            },
          },
        },
      },
    --   config = function(_, opts)
    --     vim.diagnostic.config(opts.diagnostics)
    --
    --     -- Open floating diagnostics on hover after short delay
    --     vim.o.updatetime = 250
    --     vim.cmd([[
    --   autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
    -- ]])
    --   end,
    },
  },
}
