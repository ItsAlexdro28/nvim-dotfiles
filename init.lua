-- Imported from old vimrc

-- vim.cmd([[set number 
-- set relativenumber 
-- set mouse=a 
-- set shiftwidth=4 
-- set tabstop=4 
-- set autoindent 
-- set nocompatible 
-- set nowrap]])

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.mouse = 'a'
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.autoindent = true
vim.opt.wrap = true
vim.g.have_nerd_font = true

vim.g.mapleader = " "

-- the lazy plugin installer
require("config.lazy")
require("config.lsp-zero")
require("config.cmp")
require("config.snippy")
require("config.telescope")

vim.opt.termguicolors = true
vim.cmd.colorscheme "catppuccin"



