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
    -- import your plugins
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    {'VonHeikemen/lsp-zero.nvim', branch = 'v4.x'},
    {'neovim/nvim-lspconfig'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/nvim-cmp'},
    {'dcampos/nvim-snippy'},
    {'dcampos/cmp-snippy'},
    {'honza/vim-snippets'},
    {'williamboman/mason.nvim'},
    {'williamboman/mason-lspconfig.nvim'},
    {'nvim-treesitter/nvim-treesitter'},
    {'nvim-lua/plenary.nvim'},
    {'nvim-telescope/telescope.nvim'},
    {'smolck/command-completion.nvim'},
    {
      "nvim-neo-tree/neo-tree.nvim",
      branch = "v3.x",
      dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
        -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
      }
    },
    {
      'nvim-lualine/lualine.nvim',
      dependencies = { 'nvim-tree/nvim-web-devicons' }
    },  
    {
      'goolord/alpha-nvim',
      config = function ()
          require'alpha'.setup(require'alpha.themes.dashboard'.config)
      end
    },
	{ 
    'javiorfo/nvim-springtime',
    lazy = true,
    cmd = { "Springtime", "SpringtimeUpdate" },
    dependencies = {
        "javiorfo/nvim-popcorn",
        "javiorfo/nvim-spinetta",
        "hrsh7th/nvim-cmp"
    },
    build = function()
        require'springtime.core'.update()
    end,
    opts = {
        -- This section is optional
        -- If you want to change default configurations
        -- In packer.nvim use require'springtime'.setup { ... }
        
        -- Springtime popup section
        spring = {
            -- Project: Gradle, Gradle Kotlin and Maven (Gradle default)
            project = {
                selected = 1
            },
            -- Language: Java, Kotlin and Groovy (Java default)
            language = {
                selected = 1
            },
            -- Packaging: Jar and War (Jar default)
            packaging = {
                selected = 1
            },
            -- Project Metadata defaults:
            -- Change the default values as you like
            -- This can also be edited in the popup
            project_metadata = {
                group = "com.example",
                artifact = "demo",
                name = "demo",
                package_name = "com.example.demo",
                version = "0.0.1-SNAPSHOT"
            }
        },

        -- Some popup options
        dialog = {
            -- The keymap used to select radio buttons (normal mode)
            selection_keymap = "<C-Space>",

            -- The keymap used to generate the Spring project (normal mode)
            generate_keymap = "<C-g>",

            -- If you want confirmation before generate the Spring project
            confirmation = true,

            -- Highlight links to Title and sections for changing colors
            style = {
                title_link = "Boolean",
                section_link = "Type"
            }
        },

        -- Workspace is where the generated Spring project will be saved
        workspace = {
            -- Default where Neovim is open
            path = vim.fn.expand("%:p:h"),
            
            -- Spring Initializr generates a zip file
            -- Decompress the file by default
            decompress = true,

            -- If after generation you want to open the folder
            -- Opens the generated project in Neovim by default
            open_auto = true
        },

        -- This could be enabled for debugging purposes
        -- Generates a springtime.log with debug and errors.
        internal = {
            log_debug = false
     	}
    	}
	},
	{ import = "plugins" },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})
