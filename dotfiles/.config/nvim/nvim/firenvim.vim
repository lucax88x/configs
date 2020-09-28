if exists('g:started_by_firenvim')
  " set laststatus=0

  nnoremap <silent> <Esc><Esc> :call firenvim#focus_page()<CR>
  nnoremap <silent> <C-z> :write<CR>:call firenvim#hide_frame()<CR>
endif
