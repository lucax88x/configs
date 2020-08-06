let g:ale_linters = {
\  'json': ['eslint'],
\  'javascript': ['eslint'],
\  'javascript.jsx': ['eslint'],
\  'typescript': ['eslint'],
\  'typescript.jsx': ['eslint'],
\}
let g:ale_fixers = {
\  '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'json': ['eslint', 'prettier'],
\   'javascript': ['eslint', 'prettier'],
\   'javascript.jsx': ['eslint', 'prettier'],
\   'typescript': ['eslint', 'prettier'],
\   'typescript.jsx': ['eslint', 'prettier'],
\}

let g:ale_fix_on_save = 1
" let g:ale_sign_error = '●'
" let g:ale_sign_warning = '●'
let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'
" let g:ale_lint_on_enter = 0 " Less distracting when opening a new file
