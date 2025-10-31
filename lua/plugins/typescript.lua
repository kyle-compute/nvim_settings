return {
  -- SchemaStore for JSON/YAML schemas
  {
    "b0o/schemastore.nvim",
  },

  -- TypeScript/JavaScript LSP
  {
    "neovim/nvim-lspconfig",
    dependencies = { "b0o/schemastore.nvim" },
    opts = function(_, opts)
      local schemastore = require("schemastore")
      opts.servers = opts.servers or {}
      opts.servers.jsonls = {
        settings = {
          json = {
            schemas = schemastore.json.schemas(),
            validate = { enable = true },
          },
        },
      }
      opts.servers.yamlls = {
        settings = {
          yaml = {
            schemas = schemastore.yaml.schemas(),
          },
        },
      }
      opts.servers.ts_ls = {
        settings = {
          typescript = {
            inlayHints = {
              includeInlayParameterNameHints = "all",
              includeInlayFunctionParameterTypeHints = true,
              includeInlayVariableTypeHints = true,
            },
          },
        },
      }
      opts.servers.tailwindcss = {
        -- Tailwind CSS IntelliSense
        filetypes = { "html", "css", "scss", "javascript", "javascriptreact", "typescript", "typescriptreact" },
      }
      opts.servers.eslint = {}
    end,
  },

  -- Mason tool installations for TypeScript/Next.js
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "typescript-language-server",
        "tailwindcss-language-server",
        "eslint-lsp",
        "prettier",
      },
    },
  },

  -- Prettier auto-formatting
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        json = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
      },
    },
  },
}
