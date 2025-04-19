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
vim.opt.wrap = false
vim.g.have_nerd_font = true
vim.api.nvim_set_option("clipboard","unnamed") 

vim.g.mapleader = " "

-- all the config files
require("config.lazy")
require('java').setup()
require("config.lsp-zero")
require("config.treesitter")
require("config.cmp")
require("config.snippy")
require("config.telescope")
require("config.command")
require("config.lualine")

vim.opt.termguicolors = true
vim.cmd.colorscheme "catppuccin"

-- change blade.php files to be "html"
vim.filetype.add({
  pattern = {
    ['.*%.blade%.php'] = 'html',
  }
})

vim.api.nvim_create_user_command('Nt', 'Neotree right', {})




