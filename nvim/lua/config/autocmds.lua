-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.cmd("hi lineNrBelow guifg=#666666")
vim.cmd("hi lineNrAbove guifg=#666666")

local clip_path = "/mnt/c/Windows/System32/clip.exe" -- Change this path as per your mount point

if vim.fn.executable(clip_path) == 1 then
  vim.api.nvim_create_augroup("WSLYank", { clear = true })
  vim.api.nvim_create_autocmd("TextYankPost", {
    group = "WSLYank",
    pattern = "*",
    callback = function()
      if vim.v.event.operator == "y" then
        vim.fn.system(clip_path, vim.fn.getreg('"')) -- Use the default register
      end
    end,
  })
end
