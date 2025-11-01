-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Terminal mode: Press Esc twice to exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Navigate between buffers (like Chrome tabs) - skips file explorer
-- Using Option (Alt) + arrow keys for macOS compatibility
vim.keymap.set("n", "<M-Right>", ":bnext<CR>", { desc = "Next buffer", silent = true })
vim.keymap.set("n", "<M-Left>", ":bprevious<CR>", { desc = "Previous buffer", silent = true })

-- Override LazyVim's <leader>? to show our custom cheatsheet
vim.keymap.set({ "n", "v" }, "<leader>?", function()
  local config_path = vim.fn.stdpath("config")
  local cheatsheet_file = config_path .. "/nvim-keybinds.md"

  -- Get editor dimensions
  local width = vim.o.columns
  local height = vim.o.lines

  -- Calculate floating window size (90% of screen)
  local win_width = math.floor(width * 0.9)
  local win_height = math.floor(height * 0.9)

  -- Calculate position to center the window
  local row = math.floor((height - win_height) / 2)
  local col = math.floor((width - win_width) / 2)

  -- Create a new buffer
  local buf = vim.api.nvim_create_buf(false, true) -- no file, scratch buffer

  -- Set buffer options
  vim.api.nvim_buf_set_option(buf, "bufhidden", "wipe")
  vim.api.nvim_buf_set_option(buf, "filetype", "markdown")

  -- Open floating window
  local win = vim.api.nvim_open_win(buf, true, {
    relative = "editor",
    width = win_width,
    height = win_height,
    row = row,
    col = col,
    style = "minimal",
    border = "rounded",
    title = " Keybinds Cheatsheet (/ to search, q to close) ",
    title_pos = "center",
  })

  -- Read and load the file content
  vim.cmd("read " .. cheatsheet_file)
  -- Delete the first empty line that 'read' creates
  vim.api.nvim_buf_set_lines(buf, 0, 1, false, {})

  -- Trigger markdown rendering by setting filetype again and enabling conceallevel
  vim.api.nvim_win_set_option(win, "conceallevel", 2)
  vim.api.nvim_win_set_option(win, "concealcursor", "nc")

  -- Enable markdown rendering for this buffer
  vim.defer_fn(function()
    vim.api.nvim_buf_call(buf, function()
      pcall(vim.cmd, "RenderMarkdown enable")
    end)
  end, 100)

  -- Set buffer to read-only
  vim.api.nvim_buf_set_option(buf, "modifiable", false)
  vim.api.nvim_buf_set_option(buf, "readonly", true)

  -- Map 'q' to close the window
  vim.api.nvim_buf_set_keymap(buf, "n", "q", ":close<CR>", { noremap = true, silent = true })
  -- Map <Esc> to close the window
  vim.api.nvim_buf_set_keymap(buf, "n", "<Esc>", ":close<CR>", { noremap = true, silent = true })
end, { desc = "Keybinds Cheatsheet Popup" })
