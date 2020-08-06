" alternative esc
inoremap jj <esc>
inoremap <C-c> <esc>

" quit
nnoremap <silent> <leader>q :q<CR>

" reload
nnoremap <leader><CR> :so ~/.config/nvim/init.vim<CR>

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
vnoremap X "_d

" undo
nnoremap <leader>u :UndotreeShow<CR>
