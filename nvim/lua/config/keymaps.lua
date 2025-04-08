-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
local opts = { noremap = true, silent = true }
-- Insert --
--  Press jk fast to enter
local map = vim.keymap.set
map("i", "jk", "<ESC>", opts)
map("i", "kj", "<ESC>", opts)
map("t", "jk", [[<C-\><C-n>]], opts)
map("t", "kj", [[<C-\><C-n>]], opts)
