-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--
vim.opt.winbar = "%=%m %f"
vim.g.autoformat = false
vim.cmd("set noswapfile")
vim.swapfile = false
vim.o.tabstop = 4
vim.o.shiftwidth = 4

vim.g.root_spec = { "cwd" }
