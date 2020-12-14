-- TODO: convert to lua

vim.api.nvim_exec(
[[
  function! CreateFile()
    " Prompt for new filename
    let filename = input('File name: ')
    if trim(filename) == ''
      return
    endif
    " Append filename to the path of the current buffer
    let filepath = expand("%") . filename
    " Create the file
    silent execute(printf(':!touch "%s"', filepath))
    " Reload the buffer
    normal R
  endf

  function! DeleteItemUnderCursor()
    " Grab the line under the cursor. Each line is a filepath
    let target = trim(getline('.'))
    " Feed the filepath to a delete command like, rm or trash
    silent execute(printf(':!trash %s', target))
    " Reload the buffer
    normal R
  endfunction

  augroup dirvish_confif
    autocmd!
    " 'I' will create a new file
    autocmd FileType dirvish nnoremap <silent><buffer> mf :call CreateFile()<CR>
    " 'dd' will delete file under the cursor
    autocmd FileType dirvish nnoremap <silent><buffer> dd :call DeleteItemUnderCursor()<CR>
    " open now should preview directory as tree
    autocmd FileType dirvish nnoremap <silent><buffer> p ddO<Esc>:let @"=substitute(@", '\n', '', 'g')<CR>:r ! find "<C-R>"" -maxdepth 1 -print0 \| xargs -0 ls -Fd<CR>:silent! keeppatterns %s/\/\//\//g<CR>:silent! keeppatterns %s/[^a-zA-Z0-9\/]$//g<CR>:silent! keeppatterns g/^$/d<CR>:noh<CR>
  augroup END
]],
true)

