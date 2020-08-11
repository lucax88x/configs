call plug#begin('~/.nvim/plugged')

Plug 'tpope/vim-fugitive' " git
Plug 'airblade/vim-gitgutter' " show git gutters

Plug 'vim-utils/vim-man' " man pages
Plug 'mbbill/undotree' " undo tree
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround' " Change surrounding marks

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " fuzzy finder
Plug 'junegunn/fzf.vim'
Plug 'antoinemadec/coc-fzf' " coc and fzf together

Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' } " previews hex colors
Plug 'rrethy/vim-illuminate' " highlight matching words when cursor on it

Plug 'junegunn/vim-peekaboo' " shows register preview
Plug 'vim-scripts/BufOnly.vim' " deletes all buffers except
Plug 'machakann/vim-highlightedyank' " highlights the yank
Plug 'psliwka/vim-smoothie' " smoother scroll
Plug 'liuchengxu/vim-which-key' " shows 'emacs' preview of shortcuts
Plug 'romainl/vim-cool' " disabled search highlight until next search
Plug 'markonm/traces.vim' " previews the :s commands
Plug 'AndrewRadev/sideways.vim' " allows to move functions parameters
Plug 'AndrewRadev/splitjoin.vim' " allows to split one liner to multi lines
Plug 'AndrewRadev/tagalong.vim' " changes the closing html / xml tag

Plug 'justinmk/vim-dirvish' " alternative file explorer
Plug 'airblade/vim-rooter'
Plug 'tpope/vim-abolish' " :S to replace with smartcase

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

call plug#end()
