-- alternative esc
-- using betterescape plugin
-- inoremap('jk', '<esc>')

-- quit
nnoremap('<leader>q', '<cmd>q<CR>')

-- reload
nnoremap('<leader><CR>', '<cmd>lua reload()<CR>')

-- move upper/down on visual
vnoremap('K', '<cmd>m "<-2<CR>gv=gv"')
vnoremap('J', '<cmd>m ">+1<CR>gv=gv"')

-- deletes in visual
vnoremap('X', '"_d')

-- undo
nnoremap('<leader>u', '<cmd>UndotreeToggle<CR>')
