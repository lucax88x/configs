call plug#begin('~/.nvim/plugged')

Plug 'mhinz/vim-startify' " start screen

Plug 'antoinemadec/FixCursorHold.nvim' " Fix CursorHold Performance

Plug 'tpope/vim-fugitive' " git
Plug 'airblade/vim-rooter'
Plug 'airblade/vim-gitgutter' " show git gutters
" Plug 'wfxr/minimap.vim' " requires code-minimap

Plug 'vim-utils/vim-man' " man pages
Plug 'mbbill/undotree' " undo tree

Plug 'easymotion/vim-easymotion'
Plug 'justinmk/vim-sneak'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround' " Change surrounding arks
Plug 'tpope/vim-repeat' " extends . repeat, for example for make it work with vim-sneak
Plug 'bkad/CamelCaseMotion' " allows to move by camelCase with w e

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " fuzzy finder
Plug 'junegunn/fzf.vim'

Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' } " previews hex colors
Plug 'rrethy/vim-illuminate' " highlight matching words when cursor on it
Plug 'terryma/vim-expand-region'

Plug 'machakann/vim-highlightedyank' " highlights the yank
" Plug 'junegunn/vim-peekaboo' " shows register preview
Plug 'numtostr/BufOnly.nvim', { 'on': 'BufOnly' } " deletes all buffers except
Plug 'psliwka/vim-smoothie' " smoother scroll
Plug 'liuchengxu/vim-which-key' " shows 'emacs' preview of shortcuts
Plug 'romainl/vim-cool' " disabled search highlight until next search
Plug 'markonm/traces.vim' " previews the :s commands
Plug 'AndrewRadev/sideways.vim' " allows to move functions parameters
Plug 'AndrewRadev/splitjoin.vim' " allows to split one liner to multi lines
" Plug 'AndrewRadev/tagalong.vim' " changes the closing html / xml tag

Plug 'justinmk/vim-dirvish' " alternative file explorer
"" Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-abolish' " :S to replace with smartcase

" Snippets
" Plug 'SirVer/ultisnips'
" Plug 'mlaursen/vim-react-snippets'

" Autocomplete & Linters
" Plug 'neovim/nvim-lspconfig'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'antoinemadec/coc-fzf' " coc and fzf together

" Language packs
Plug 'nvim-treesitter/nvim-treesitter'
"" Plug 'sheerun/vim-polyglot' " programming language packs
" Plug 'HerringtonDarkholme/yats.vim'
" Plug 'maxmellon/vim-jsx-pretty'

Plug 'jceb/vim-orgmode'

" Theming
Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim' " status bar
Plug 'shinchu/lightline-gruvbox.vim'

Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }

call plug#end()
