return {
  -- Kulala: Simple HTTP client (like Postman but in nvim)
  {
    "mistweaverco/kulala.nvim",
    ft = "http",
    keys = {
      { "<leader>rr", "<cmd>lua require('kulala').run()<cr>", desc = "Run HTTP request" },
      { "<leader>rt", "<cmd>lua require('kulala').toggle_view()<cr>", desc = "Toggle HTTP result view" },
      { "<leader>rc", "<cmd>lua require('kulala').copy()<cr>", desc = "Copy HTTP request as cURL" },
    },
    config = function()
      require("kulala").setup()
    end,
  },
}
