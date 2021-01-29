-- local imap = vim.keymap.imap
-- local smap = vim.keymap.smap
-- local nnoremap = vim.keymap.nnoremap

-- nnoremap { '<leader>hello', function() print("Hello world, from lua") end }


-- -- Expand
-- keymap.imap { '<C-j>', "vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'", expr = true }
-- keymap.smap { '<C-j>', "vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'", expr = true }

-- -- Expand or jump
-- keymap.imap { '<C-l>', "vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'", expr = true  }
-- keymap.smap { '<C-l>', "vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'", expr = true  }

-- -- Jump forward or backward
-- keymap.imap { '<Tab>', "snip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'", expr = true  }
-- keymap.smap { '<Tab>', "vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'", expr = true  }
-- keymap.imap { '<S-Tab>', "vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'", expr = true  }
-- keymap.smap { '<S-Tab>', "vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'", expr = true  }
