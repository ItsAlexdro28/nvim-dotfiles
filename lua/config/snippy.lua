-- require 'cmp'.setup {
--   snippet = {
--     expand = function(args)
--       require 'snippy'.expand_snippet(args.body)
-- 
--     end
--   },
-- 
--   sources = {
--     { name = 'snippy' }
--   }
-- }
-- 
-- vim.cmd[[
-- imap <expr> <Tab> snippy#can_expand_or_advance() ? '<Plug>(snippy-expand-or-advance)' : '<Tab>'
-- imap <expr> <S-Tab> snippy#can_jump(-1) ? '<Plug>(snippy-previous)' : '<S-Tab>'
-- smap <expr> <Tab> snippy#can_jump(1) ? '<Plug>(snippy-next)' : '<Tab>'
-- smap <expr> <S-Tab> snippy#can_jump(-1) ? '<Plug>(snippy-previous)' : '<S-Tab>'
-- xmap <Tab> <Plug>(snippy-cut-text)
-- ]]
local cmp = require("cmp")

cmp.setup({
  snippet = {
    expand = function(args)
      require("snippy").expand_snippet(args.body)
    end,
  },

  mapping = cmp.mapping.preset.insert({
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif vim.fn["snippy#can_expand_or_advance"]() == 1 then
        vim.fn["snippy#expand_or_advance"]()
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif vim.fn["snippy#can_jump_back"]() == 1 then
        vim.fn["snippy#previous"]()
      else
        fallback()
      end
    end, { "i", "s" }),
  }),
})
