local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        -- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
      ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      -- { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- To use git you need to install the plugin petertriho/cmp-git and uncomment lines below
  -- Set configuration for specific filetype.
  --[[ cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'git' },
    }, {
      { name = 'buffer' },
    })
 })
 require("cmp_git").setup() ]]-- 

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    }),
    matching = { disallow_symbol_nonprefix_matching = false }
  })

  -- Set up lspconfig.
  local capabilities = require('cmp_nvim_lsp').default_capabilities()
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  --
  require('lspconfig')['lua_ls'].setup {
    capabilities = capabilities,
    filetypes = { "lua" }
  }
  
  require('lspconfig')['biome'].setup {
    capabilities = capabilities,
    filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact", "json" }
  }
  
  require('lspconfig')['jdtls'].setup {
    filetypes = { "java" }
  }
  
  require('lspconfig')['vtsls'].setup {
    capabilities = capabilities,
    filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact" }
  }
  
  require('lspconfig')['emmet_language_server'].setup {
    capabilities = capabilities,
    filetypes = { "html", "css", "javascriptreact", "typescriptreact" }
  }
  
  require('lspconfig')['pyright'].setup {
    capabilities = capabilities,
    filetypes = { "python" }
  }
  
  require('lspconfig')['stimulus_ls'].setup {
    capabilities = capabilities,
    filetypes = { "javascript", "typescript", "html", "erb" }
  }
  
  require('lspconfig')['tailwindcss'].setup {
    capabilities = capabilities,
    filetypes = { "html", "javascript", "typescript", "javascriptreact", "typescriptreact", "svelte", "vue" }
  }
  
  require('lspconfig')['intelephense'].setup {
    capabilities = capabilities,
    filetypes = { "php" }
  }
