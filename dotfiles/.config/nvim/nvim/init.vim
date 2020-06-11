syntax on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Defaults
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" set guicursor=
set noshowmatch
" set nohlsearch
set hidden
set noerrorbells

set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set smarttab
set nowrap

" set number norelativenumber
set relativenumber number
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=8

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" set colorcolumn=80

" sign colum is the left one showing error & warnings
set signcolumn=yes

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.nvim/plugged')

Plug 'mhinz/vim-startify'
Plug 'tpope/vim-fugitive' " git
Plug 'vim-utils/vim-man' " man pages
Plug 'mbbill/undotree' " undo tree
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " fuzzy finder
Plug 'junegunn/fzf.vim'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'

" Autocomplete & Linters
Plug 'neoclide/coc.nvim', {'branch': 'release'} " autocomplete
Plug 'dense-analysis/ale'

" Language packs
Plug 'sheerun/vim-polyglot' " programming language packs
Plug 'rust-lang/rust.vim'
Plug 'tweekmonster/gofmt.vim' " go formatter

" Theming
Plug 'morhetz/gruvbox'
Plug 'phanviet/vim-monokai-pro'
Plug 'vim-airline/vim-airline' " status bar
Plug 'flazz/vim-colorschemes'
Plug 'ryanoasis/vim-devicons'
Plug 'ap/vim-css-color'                           " Color previews for CSS
Plug 'tpope/vim-surround'                         " Change surrounding marks
Plug 'vim-airline/vim-airline'

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Airline settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_powerline_fonts = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Go settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_variable_declarations = 1
let g:go_auto_sameids = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Rust settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:rustfmt_autosave = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Theme
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme gruvbox
set background=dark
highlight ColorColumn ctermbg=0 guibg=lightgrey

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => RipGrep Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if executable('rg')
    let g:rg_derive_root='true'
endif

let loaded_matchparen = 1
let mapleader = " "

let g:netrw_browse_split = 2
let g:vrfr_rg = 'true'
let g:netrw_banner = 0
let g:netrw_winsize = 25

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ALE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ale_linters = {
\  'javascript': ['eslint'],
\  'javascript.jsx': ['eslint'],
\  'typescript': ['eslint'],
\  'typescript.jsx': ['eslint'],
\}
let g:ale_fixers = {
\  '*': ['remove_trailing_lines', 'trim_whitespace'],
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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Remaps
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" alternative esc
inoremap jj <ESC>

" buffers
nnoremap <leader>bd :bd<cr>
nnoremap <leader>bad :%bd<cr>
nnoremap <leader>bs :update<cr>
nnoremap <leader>bw :update<cr>

" window movement
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

" undo
nnoremap <leader>u :UndotreeShow<CR>

" project management
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <leader>ps :Rg<SPACE>
" to include unstaged files
nnoremap <leader>pg :GFiles --cached --others --exclude-standard<CR>
nnoremap <leader>pf :Files<CR>
nnoremap <leader>bl :Buffers<CR>

" reload
nnoremap <leader><CR> :so ~/.config/nvim/init.vim<CR>

nnoremap <leader>+ :vertical resize +5<CR>
nnoremap <leader>- :vertical resize -5<CR>
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
vnoremap X "_d
inoremap <C-c> <esc>


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

" CoC maps
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)
nmap <leader>rr <Plug>(coc-rename)
nmap <leader>g[ <Plug>(coc-diagnostic-prev)
nmap <leader>g] <Plug>(coc-diagnostic-next)
nmap <silent> <leader>gp <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>gn <Plug>(coc-diagnostic-next)
nnoremap <leader>cr :CocRestart
nnoremap <leader>cf :CocFix<CR>
nnoremap <leader>fo :CocAction('runCommand', 'tsserver.organizeImports')<CR>

" ALE maps
nnoremap <leader>ff :ALEFix<CR>

" Sweet Sweet FuGITive
nmap <leader>gh :diffget //3<CR>
nmap <leader>gu :diffget //2<CR>
nmap <leader>gs :G<CR>

" Easymotion maps
map <leader>jl <Plug>(easymotion-bd-l)
map <leader>js <Plug>(easymotion-bd-s)

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

autocmd BufWritePre * :call TrimWhitespace()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Mapping extension to file types
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup FiletypeGroup
    autocmd!
    au BufNewFile,BufRead *.jsx set filetype=javascript.jsx
    au BufNewFile,BufRead *.tsx set filetype=typescript.tsx
augroup END
