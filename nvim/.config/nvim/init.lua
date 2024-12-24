-- Install plugins using Packer
vim.cmd [[packadd packer.nvim]]
-- Basic vim options
-- Basic vim options
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.background = 'light'

-- Load and apply the theme
require('core.themes.vintage-tech').setup()
