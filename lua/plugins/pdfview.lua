return {
  {
    "nvim-tree/nvim-tree.lua",
    keys = {
      {
        "<leader>p",
        function()
          local file = vim.fn.expand("%:p")
          if file:match("%.pdf$") then
            vim.fn.jobstart({ "zathura", "--fork", file }, { detach = true })
            print("Opening PDF in Zathura: " .. vim.fn.fnamemodify(file, ":t"))
          else
            print("Not a PDF file")
          end
        end,
        desc = "Open PDF in Zathura",
      },
    },
  },
}
