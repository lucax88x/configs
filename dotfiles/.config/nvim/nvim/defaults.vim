" set guicursor=
set showmatch
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
set cmdheight=1

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Set completeopt to have a better completion experience
" :help completeopt
" menuone: popup even when there's only one match
" noinsert: Do not insert text until a selection is made
" noselect: Do not select, force user to select one from the menu
set completeopt=menuone,noinsert,noselect

" set colorcolumn=80

" sign colum is the left one showing error & warnings
set signcolumn=yes

let loaded_matchparen = 1
let mapleader = "\<Space>"

" set cursorline   " highlight current line
" set cursorcolumn " highlight current column

" done by status bar
set noshowmode
