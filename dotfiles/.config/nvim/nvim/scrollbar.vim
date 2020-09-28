augroup nvim_scrollbar
    autocmd!
    autocmd BufEnter    * silent! lua require('scrollbar').show()
    autocmd BufLeave    * silent! lua require('scrollbar').clear()

    autocmd CursorMoved * silent! lua require('scrollbar').show()
    autocmd VimResized  * silent! lua require('scrollbar').show()

    autocmd FocusGained * silent! lua require('scrollbar').show()
    autocmd FocusLost   * silent! lua require('scrollbar').clear()
augroup end


  let g:scrollbar_max_size = 8
  let g:scrollbar_min_size = 3
  let g:scrollbar_right_offset = 0

  let g:scrollbar_shape = {
    \ 'head': '',
    \ 'body': '█',
    \ 'tail': '',
    \ }

  let g:scrollbar_width = 1

