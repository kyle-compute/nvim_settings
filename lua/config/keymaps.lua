-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Terminal mode: Press Esc twice to exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Navigate between code splits (like Chrome tabs)
vim.keymap.set("n", "<C-PageDown>", "<C-w>w", { desc = "Next split" })
vim.keymap.set("n", "<C-PageUp>", "<C-w>W", { desc = "Previous split" })
