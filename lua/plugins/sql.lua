return {
  -- SQL LSP
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        sqlls = {}, -- SQL language server
      },
    },
  },

  -- SQL formatter
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        sql = { "sql_formatter" },
      },
    },
  },

  -- Mason installations
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "sqlls",
        "sql-formatter",
      },
    },
  },

  -- DADBOD: Database UI (optional but amazing for PostgreSQL)
  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = {
      { "tpope/vim-dadbod", lazy = true },
      { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
    },
    cmd = {
      "DBUI",
      "DBUIToggle",
      "DBUIAddConnection",
      "DBUIFindBuffer",
    },
    keys = {
      { "<leader>db", "<cmd>DBUIToggle<cr>", desc = "Toggle Database UI" },
    },
    init = function()
      vim.g.db_ui_use_nerd_fonts = 1
      vim.g.db_ui_show_database_icon = 1
    end,
  },
}
