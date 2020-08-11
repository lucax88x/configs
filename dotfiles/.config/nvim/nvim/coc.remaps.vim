nmap <silent> <leader>td <Plug>(coc-definition)
nmap <silent> <leader>tt <Plug>(coc-type-definition)
nmap <silent> <leader>ti <Plug>(coc-implementation)
nmap <silent> <leader>tr <Plug>(coc-references)
nnoremap <leader>th :call <SID>show_documentation()<CR>
nnoremap <silent> <leader>to :<C-u>CocFzfList outline<CR>

nmap <leader>rr <Plug>(coc-rename)
nnoremap <silent> <leader>cc :<C-u>CocFzfList commands<CR>

nnoremap <silent> <leader>fe :<C-u>CocFzfList diagnostics<CR>
nnoremap <silent> <leader>fa :<C-u>CocFzfList actions<CR>
nnoremap <silent> <leader>fo :call CocAction('runCommand', 'editor.action.organizeImport')<CR>
nnoremap <silent> <leader>ff :<C-u>:call CocAction('format')<CR>
nnoremap <silent> <leader>fl :CocCommand eslint.executeAutofix<CR>

nnoremap <leader>pws :CocSearch <C-R>=expand("<cword>")<CR><CR>
" nmap <leader>g[ <Plug>(coc-diagnostic-prev)
" nmap <leader>g] <Plug>(coc-diagnostic-next)
" nmap <silent> <leader>gp <Plug>(coc-diagnostic-prev)
" nmap <silent> <leader>gn <Plug>(coc-diagnostic-next)
nnoremap <silent> <leader>cr :CocRestart<CR>
nnoremap <silent> <leader>cf :CocFix<CR>

" shows the actual type on cursor
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" CoC autocomplete improvements
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <silent><expr> <C-space> coc#refresh()
" To make <cr> select the first completion item and confirm the completion when no item has been selected:
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
