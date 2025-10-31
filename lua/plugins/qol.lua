return {
  -- Auto-save files
  {
    "okuuva/auto-save.nvim",
    event = { "InsertLeave", "TextChanged" },
    opts = {
      enabled = true,
      trigger_events = {
        immediate_save = { "BufLeave", "FocusLost" },
        defer_save = { "InsertLeave", "TextChanged" },
      },
      condition = function(buf)
        local fn = vim.fn
        local utils = require("auto-save.utils.data")
        -- Don't auto-save for certain filetypes
        if utils.not_in(fn.getbufvar(buf, "&filetype"), { "oil", "neo-tree" }) then
          return true
        end
        return false
      end,
    },
  },

  -- Persistent terminals
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {
      size = 20,
      open_mapping = [[<c-\>]],
      hide_numbers = true,
      shade_terminals = true,
      start_in_insert = true,
      insert_mappings = true,
      persist_size = true,
      persist_mode = true,
      direction = "horizontal", -- or "vertical", "tab", "float"
      close_on_exit = false, -- Keep terminal open even after process exits
      shell = vim.o.shell,
      float_opts = {
        border = "curved",
        winblend = 0,
      },
    },
    keys = {
      { "<c-\\>", "<cmd>ToggleTerm<cr>", desc = "Toggle Terminal" },
      { "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", desc = "Toggle Floating Terminal" },
      { "<leader>th", "<cmd>ToggleTerm direction=horizontal<cr>", desc = "Toggle Horizontal Terminal" },
      { "<leader>tv", "<cmd>ToggleTerm direction=vertical<cr>", desc = "Toggle Vertical Terminal" },
    },
  },
}
