-- quit
nnoremap('<leader>q', '<cmd>q<CR>')
nnoremap('<leader>Q', '<cmd>q!<CR>')

-- reload
nnoremap('<leader><CR>', '<cmd>lua reload()<CR>')

-- move upper/down on visual
vnoremap('K', '<cmd>m "<-2<CR>gv=gv"')
vnoremap('J', '<cmd>m ">+1<CR>gv=gv"')

-- deletes in visual
vnoremap('X', '"_d')

-- undo
nnoremap('<leader>u', '<cmd>UndotreeToggle<CR>')

-- when going to next search, we center screen
nnoremap('n', 'nzzzv')
nnoremap('N', 'Nzzzv')
