return {
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        -- Use fdfind instead of fd on Ubuntu/Debian
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
        },
      },
      pickers = {
        find_files = {
          find_command = { "fdfind", "--type", "f", "--type", "l", "--color", "never" },
        },
      },
    },
  },
}
