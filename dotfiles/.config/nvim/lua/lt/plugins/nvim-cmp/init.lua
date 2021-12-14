local present, cmp = pcall(require, 'cmp')
local presentLspKind, lspKind = pcall(require, 'lspkind')

if not present then return end
if presentLspKind then lspKind.init() end

cmp.setup({
  snippet = {
    expand = function(args) require('luasnip').lsp_expand(args.body) end
  },
  mapping = {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true
    }),
    ['<C-n>'] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif require('luasnip').expand_or_jumpable() then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes(
                            '<Plug>luasnip-expand-or-jump', true, true, true),
                        '')
      else
        local copilot_keys = vim.fn['copilot#Accept']()
        if copilot_keys ~= '' then
          vim.api.nvim_feedkeys(copilot_keys, 'i', true)
        else
          fallback()
        end
      end
    end,
    ['<C-p>'] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif require('luasnip').jumpable(-1) then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes(
                            '<Plug>luasnip-jump-prev', true, true, true), '')
      else
        fallback()
      end
    end
  },
  formatting = {
    format = function(entry, vim_item)
      -- fancy icons and a name of kind
      vim_item.kind = lspKind.presets.default[vim_item.kind] .. ' ' ..
                          vim_item.kind

      -- set a name for each source
      vim_item.menu = ({
        nvim_lsp = '[LSP]',
        luasnip = '[snp]',
        buffer = '[buf]',
        nvim_lua = '[lua]',
        path = '[path]'
      })[entry.source.name]

      return vim_item
    end
  },
  sources = {
    {name = 'luasnip', max_item_count = 10},
    {name = 'nvim_lsp', max_item_count = 10}, {name = 'nvim_lua'},
    {name = 'path'}, {name = 'buffer', keyword_length = 3, max_item_count = 10}
  }
})

vim.cmd(
    'highlight! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#808080')
vim.cmd('highlight! CmpItemAbbrMatch guibg=NONE guifg=#569CD6')
vim.cmd('highlight! CmpItemAbbrMatchFuzzy guibg=NONE guifg=#569CD6')
vim.cmd('highlight! CmpItemKindVariable guibg=NONE guifg=#9CDCFE')
vim.cmd('highlight! CmpItemKindInterface guibg=NONE guifg=#9CDCFE')
vim.cmd('highlight! CmpItemKindText guibg=NONE guifg=#9CDCFE')
vim.cmd('highlight! CmpItemKindFunction guibg=NONE guifg=#C586C0')
vim.cmd('highlight! CmpItemKindMethod guibg=NONE guifg=#C586C0')
vim.cmd('highlight! CmpItemKindKeyword guibg=NONE guifg=#D4D4D4')

local presentAutopairs, cmp_autopairs = pcall(require,
                                              'nvim-autopairs.completion.cmp')
if not presentAutopairs then return end

cmp.event:on('confirm_done',
             cmp_autopairs.on_confirm_done({map_char = {tex = ''}}))
