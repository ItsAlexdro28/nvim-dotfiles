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

-- all the config files
require("config.lazy")
require("config.lsp-zero")
require("config.cmp")
require("config.snippy")
require("config.telescope")
require("config.command")
require("config.lualine")

vim.opt.termguicolors = true
vim.cmd.colorscheme "catppuccin"

vim.api.nvim_create_user_command('Nt', 'Neotree right', {})




