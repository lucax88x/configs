syntax on

source $HOME/.config/nvim/defaults.vim

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.nvim/plugged')

Plug 'tpope/vim-fugitive' " git
Plug 'airblade/vim-gitgutter' " show git gutters
Plug 'vim-utils/vim-man' " man pages
Plug 'mbbill/undotree' " undo tree
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " fuzzy finder
Plug 'junegunn/fzf.vim'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround' " Change surrounding marks
Plug 'antoinemadec/coc-fzf' " coc and fzf together
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' } " previews hex colors
Plug 'junegunn/vim-peekaboo' " shows register preview
Plug 'vim-scripts/BufOnly.vim' " deletes all buffers except
Plug 'machakann/vim-highlightedyank' " highlights the yank
Plug 'psliwka/vim-smoothie' " smoother scroll
Plug 'liuchengxu/vim-which-key' " shows 'emacs' preview of shortcuts
Plug 'romainl/vim-cool' " disabled search highlight until next search
Plug 'markonm/traces.vim' " previews the :s commands
Plug 'AndrewRadev/sideways.vim' " allows to move functions parameters
Plug 'AndrewRadev/splitjoin.vim' " allows to split one liner to multi lines
Plug 'justinmk/vim-dirvish' " alternative file explorer

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

source $HOME/.config/nvim/theme.vim
source $HOME/.config/nvim/airline.vim
source $HOME/.config/nvim/rust.vim
source $HOME/.config/nvim/ale.vim
source $HOME/.config/nvim/fzf.vim
source $HOME/.config/nvim/hexokinase.vim
source $HOME/.config/nvim/peekaboo.vim
source $HOME/.config/nvim/which-key.vim
source $HOME/.config/nvim/ripgrep.vim
source $HOME/.config/nvim/default.remaps.vim
source $HOME/.config/nvim/coc.remaps.vim
source $HOME/.config/nvim/fzf.remaps.vim
source $HOME/.config/nvim/project.remaps.vim
source $HOME/.config/nvim/buffer.remaps.vim
source $HOME/.config/nvim/window.remaps.vim
source $HOME/.config/nvim/which-key.remaps.vim
source $HOME/.config/nvim/ale.remaps.vim
source $HOME/.config/nvim/git.remaps.vim
source $HOME/.config/nvim/easymotion.remaps.vim
source $HOME/.config/nvim/editor.remaps.vim
source $HOME/.config/nvim/filetypes.vim
source $HOME/.config/nvim/events.vim
