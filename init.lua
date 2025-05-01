-- Welcome to my nvim-dotfiles
-- Modular Neovim configuration using Lazy.nvim

-- ▶ General Settings
vim.g.mapleader = " "
vim.g.have_nerd_font = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.mouse = 'a'
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.autoindent = true
vim.opt.wrap = false
vim.opt.clipboard = "unnamed"
vim.opt.termguicolors = true

-- ▶ Load Plugins & config files (using Lazy.nvim)
require("config.lazy")
require('java').setup()
require("config.lsp-zero")
require("config.treesitter")
require("config.cmp")
require("config.snippy")
require("config.telescope")
require("config.wilder")
require("config.lualine")

-- ▶ Theme
vim.cmd.colorscheme "catppuccin"

-- ▶ Filetype Fixes
vim.filetype.add({
  pattern = {
    ['.*%.blade%.php'] = 'html',
  }
})

-- ▶ Custom Commands
vim.api.nvim_create_user_command('Nt', 'Neotree right', {})


