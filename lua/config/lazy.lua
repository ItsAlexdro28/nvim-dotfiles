-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
  spec = {

  -- 🌈 Theme: load immediately for startup colors
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },

  -- ⚙️ LSP Setup via lsp-zero (wraps lspconfig, mason, etc.)
  { 'VonHeikemen/lsp-zero.nvim', branch = 'v4.x' },
  { 'hrsh7th/nvim-cmp', event = "InsertEnter" },  -- lazy load on insert
  { 'dcampos/nvim-snippy', lazy = true },
  { 'dcampos/cmp-snippy', lazy = true },
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'williamboman/mason-lspconfig.nvim' },
  { 'williamboman/mason.nvim', cmd = "Mason" },  -- load only when using :Mason

  -- 🌳 Syntax Highlighting
  {
    'nvim-treesitter/nvim-treesitter',
    build = ":TSUpdate",
    event = "BufReadPost"
  },

  -- 🔎 Telescope fuzzy finder
  {
    'nvim-telescope/telescope.nvim',
    cmd = "Telescope",
    dependencies = { 'nvim-lua/plenary.nvim' }
  },

  -- 🧠 Command completion (remove if not useful)
  {
    'gelguy/wilder.nvim'
  },

  -- 📁 File Explorer
  {
    "nvim-neo-tree/neo-tree.nvim",
    cmd = "Neotree",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    }
  },

  -- 📊 Statusline
  {
    'nvim-lualine/lualine.nvim',
    event = "VeryLazy",
    dependencies = { 'nvim-tree/nvim-web-devicons' }
  },

  -- 🎉 Startup dashboard
  {
    'goolord/alpha-nvim',
    event = "VimEnter",
    config = function ()
      require'alpha'.setup(require'alpha.themes.dashboard'.config)
    end
  },

  -- 🌀 Git log viewer
  {
    "rbong/vim-flog",
    lazy = true,
    cmd = { "Flog", "Flogsplit", "Floggit" },
    dependencies = {
      "tpope/vim-fugitive",
    },
  },

  -- ⚙️ Optional Java plugin (only load when needed)
  {
    'nvim-java/nvim-java',
    ft = { "java" }
  },

  -- 🧩 Blade template syntax
  {
    'jwalton512/vim-blade',
    ft = { "blade", "php" }
  },
	{ import = "plugins" },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})
