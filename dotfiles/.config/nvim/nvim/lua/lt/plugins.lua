-- Only required if you have packer in your `opt` pack
local packer_exists = pcall(vim.cmd, [[packadd packer.nvim]])

if not packer_exists then
  -- TODO: Maybe handle windows better?
  if vim.fn.input("Download Packer? (y for yes)") ~= "y" then
    return
  end

  local directory = string.format(
    '%s/site/pack/packer/opt/',
    vim.fn.stdpath('data')
  )

  vim.fn.mkdir(directory, 'p')

  local out = vim.fn.system(string.format(
    'git clone %s %s',
    'https://github.com/wbthomason/packer.nvim',
    directory .. '/packer.nvim'
  ))

  print(out)
  print("Downloading packer.nvim...")

  return
end

return require('packer').startup {
  function(use)
    -- Packer can manage itself as an optional plugin
    use {'wbthomason/packer.nvim', opt = true}

    use 'nvim-lua/plenary.nvim'
    use 'nvim-lua/popup.nvim'

    use 'mhinz/vim-startify' -- start screen
    use 'tweekmonster/startuptime.vim' -- benchmark startup

    use 'antoinemadec/FixCursorHold.nvim' -- Fix CursorHold Performance

    use 'tpope/vim-fugitive' -- git
    use 'airblade/vim-rooter'
    use 'airblade/vim-gitgutter' -- show git gutters

    use 'vim-utils/vim-man' -- man pages
    use 'mbbill/undotree' -- undo tree

    use 'easymotion/vim-easymotion'
    use 'justinmk/vim-sneak'
    use 'tpope/vim-commentary'
    use 'tpope/vim-surround' -- Change surrounding arks
    use 'tpope/vim-repeat' -- extends . repeat, for example for make it work with vim-sneak
    use 'bkad/CamelCaseMotion' -- allows to move by camelCase with w e

    use {'junegunn/fzf', run = './install --all' }     -- Fuzzy Searcher
    use {'junegunn/fzf.vim'}
    -- use 'ojroques/nvim-lspfuzzy', {'branch': 'main'}

    use 'nvim-telescope/telescope.nvim'

    use {'rrethy/vim-hexokinase', run = 'make hexokinase' } -- preview hex colors

    use 'rrethy/vim-illuminate' -- highlight matching words when cursor on it
    use 'terryma/vim-expand-region'

    use 'machakann/vim-highlightedyank' -- highlights the yank
    use 'junegunn/vim-peekaboo' -- shows register preview
    use 'numtostr/BufOnly.nvim' -- deletes all buffers except
    use 'psliwka/vim-smoothie' -- smoother scroll
    use 'liuchengxu/vim-which-key' -- shows 'emacs' preview of shortcuts
    use 'romainl/vim-cool' -- disabled search highlight until next search
    use 'markonm/traces.vim' -- previews the :s commands
    use 'AndrewRadev/sideways.vim' -- allows to move functions parameters
    use 'AndrewRadev/splitjoin.vim' -- allows to split one liner to multi lines
    -- use 'AndrewRadev/tagalong.vim' -- changes the closing html / xml tag

    use 'justinmk/vim-dirvish' -- alternative file explorer
    use 'ryanoasis/vim-devicons'
    use 'kyazdani42/nvim-web-devicons'

    use 'tpope/vim-abolish' -- :S to replace with smartcase

    -- Snippets
    use 'norcalli/snippets.nvim'

    -- Autocomplete & Linters

    use 'neovim/nvim-lspconfig'
    use 'nvim-lua/lsp-status.nvim'
    use 'tjdevries/lsp_extensions.nvim'
    use 'nvim-lua/completion-nvim'

    -- use 'neoclide/coc.nvim', {'branch': 'release'}
    -- use 'antoinemadec/coc-fzf' -- coc and fzf together

    -- Language packs
    use {
      'nvim-treesitter/nvim-treesitter',
      run = function() vim.cmd [[TSUpdate]] end
    }
    use 'jceb/vim-orgmode'

    -- Theming
    use 'morhetz/gruvbox'

    -- status line
    use 'itchyny/lightline.vim'
    use 'shinchu/lightline-gruvbox.vim'
    -- use 'tjdevries/express_line.nvim'

    use {
      'glacambre/firenvim',
      run = function()
        vim.fn['firenvim#install'](0)
      end
    }
  end
}
