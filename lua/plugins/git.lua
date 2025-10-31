return {
  -- Better git signs in the gutter
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      current_line_blame = true, -- Show git blame inline
      current_line_blame_opts = {
        delay = 300,
      },
    },
  },

  -- Git conflict resolver
  {
    "akinsho/git-conflict.nvim",
    version = "*",
    config = true,
    keys = {
      { "<leader>gco", "<cmd>GitConflictChooseOurs<cr>", desc = "Git Conflict: Choose Ours" },
      { "<leader>gct", "<cmd>GitConflictChooseTheirs<cr>", desc = "Git Conflict: Choose Theirs" },
      { "<leader>gcb", "<cmd>GitConflictChooseBoth<cr>", desc = "Git Conflict: Choose Both" },
      { "<leader>gcn", "<cmd>GitConflictNextConflict<cr>", desc = "Git Conflict: Next" },
      { "<leader>gcp", "<cmd>GitConflictPrevConflict<cr>", desc = "Git Conflict: Previous" },
    },
  },
}
