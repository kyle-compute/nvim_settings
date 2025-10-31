return {
  -- Python LSP with virtual environment support
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = {
          settings = {
            python = {
              analysis = {
                autoSearchPaths = true,
                diagnosticMode = "workspace",
                useLibraryCodeForTypes = true,
                typeCheckingMode = "basic",
              },
            },
          },
        },
      },
    },
  },

  -- Ruff for linting and formatting
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        python = { "ruff_format" },
      },
    },
  },

  -- Mason to auto-install tools
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "pyright",
        "ruff",
        "debugpy", -- Python debugger
      },
    },
  },

  -- DAP for debugging
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "mfussenegger/nvim-dap-python",
    },
    config = function()
      local dap_python = require("dap-python")
      -- This will use the python from your current virtual environment
      dap_python.setup("python")
    end,
  },

  -- Virtual environment selector
  {
    "linux-cultist/venv-selector.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "nvim-telescope/telescope.nvim",
      "mfussenegger/nvim-dap-python",
    },
    opts = {
      name = { "venv", ".venv", "env", ".env" },
    },
    event = "VeryLazy",
    keys = {
      { "<leader>cv", "<cmd>VenvSelect<cr>", desc = "Select VirtualEnv" },
    },
  },
}
