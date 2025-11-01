-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Terminal mode: Press Esc twice to exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Navigate between buffers (like Chrome tabs) - skips file explorer
-- Using Option (Alt) + arrow keys for macOS compatibility
vim.keymap.set("n", "<M-Right>", ":bnext<CR>", { desc = "Next buffer", silent = true })
vim.keymap.set("n", "<M-Left>", ":bprevious<CR>", { desc = "Previous buffer", silent = true })
