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

Plug 'tpope/vim-fugitive' " git
Plug 'vim-utils/vim-man' " man pages
Plug 'mbbill/undotree' " undo tree
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " fuzzy finder
Plug 'junegunn/fzf.vim'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'                         " Change surrounding marks
Plug 'antoinemadec/coc-fzf' " coc and fzf together
Plug 'airblade/vim-gitgutter' " show git gutters
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' } " previews hex colors
Plug 'junegunn/vim-peekaboo' " shows register preview
Plug 'vim-scripts/BufOnly.vim' " deletes all buffers except
Plug 'machakann/vim-highlightedyank' " highlights the yank
Plug 'tpope/vim-vinegar' " improves netrw
Plug 'psliwka/vim-smoothie' " smoother scroll
Plug 'liuchengxu/vim-which-key' " shows 'emacs' preview of shortcuts
Plug 'romainl/vim-cool' " disabled search highlight until next search
Plug 'markonm/traces.vim' " previews the :s commands

" Snippets
Plug 'SirVer/ultisnips'
Plug 'mlaursen/vim-react-snippets'

" Autocomplete & Linters
Plug 'neoclide/coc.nvim', {'branch': 'release'} " autocomplete
Plug 'dense-analysis/ale'

" Language packs
Plug 'sheerun/vim-polyglot' " programming language packs
Plug 'rust-lang/rust.vim'
Plug 'jceb/vim-orgmode'

" Theming
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline' " status bar
Plug 'vim-airline/vim-airline'

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Airline settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_powerline_fonts = 1

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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => fzf settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => hexokinase settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:Hexokinase_highlighters = ['virtual']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => peekaboo settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:peekaboo_window = 'vert bo 60new'
let g:peekaboo_delay = 100

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => which-key settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Define prefix dictionary
let g:which_key_map = {}

let g:which_key_map.g = {
            \ 'name':"git",
            \}

let g:which_key_map.t = {
            \ 'name':"types",
            \}

let g:which_key_map.c = {
            \ 'name':"CoC",
            \}

let g:which_key_map.b = {
            \ 'name':"buffers",
            \}

let g:which_key_map.p = {
            \ 'name':"project",
            \}

let g:which_key_map.f = {
            \ 'name':"fix",
            \}

call which_key#register('<Space>', "g:which_key_map")

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Remaps
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" alternative esc
inoremap jj <ESC>

" buffers
nnoremap <leader>bd :bd<CR>
nnoremap <leader>bo :BufOnly<CR>
nnoremap <leader>bad :%bd<CR>
nnoremap <leader>bs :update<CR>
nnoremap <leader>bw :update<CR>

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

" quit
nnoremap <silent> <leader>q :q<CR>

" reload
nnoremap <silent> <leader><CR> :so ~/.config/nvim/init.vim<CR>

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

" fzf maps
nnoremap <leader>sl :Snippets<CR>
nnoremap <leader>ml :Marks<CR>
nnoremap <leader>bl :Buffers<CR>

" CoC maps
nmap <silent> <leader>td <Plug>(coc-definition)
nmap <silent> <leader>tt <Plug>(coc-type-definition)
nmap <silent> <leader>ti <Plug>(coc-implementation)
nmap <silent> <leader>tr <Plug>(coc-references)
nnoremap <leader>th :call <SID>show_documentation()<CR>
nnoremap <silent> <leader>to :<C-u>CocFzfList outline<CR>

nmap <leader>rr <Plug>(coc-rename)
nnoremap <silent> <leader>cc :<C-u>CocFzfList commands<CR>
nnoremap <silent> <leader>fe :<C-u>CocFzfList diagnostics<CR>
nnoremap <silent> <leader>ff :<C-u>CocFzfList actions<CR>
" nnoremap <silent> <leader>ff :<C-u>:call CocAction('format')<CR>
nnoremap <silent> <leader>fo :call CocAction('runCommand', 'editor.action.organizeImport')<CR>
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

" triggers the shortcut suggestion
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>

" ALE maps
nnoremap <silent> <leader>fl :ALEFix<CR>

" FuGITive
nmap <leader>gs :G<CR>
nmap <leader>gf :diffget //2<CR>
nmap <leader>gj :diffget //3<CR>
nmap <leader>gd :Gdiffsplit<CR>

" vim-gitgutter
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)
nmap ghs <Plug>(GitGutterStageHunk)
nmap ghu <Plug>(GitGutterUndoHunk)
nmap ghp <Plug>(GitGutterPreviewHunk)

" Easymotion maps
" :help easymotion and look for binds
map <leader>; <Plug>(easymotion-s)

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
