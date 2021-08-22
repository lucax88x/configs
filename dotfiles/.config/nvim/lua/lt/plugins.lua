-- Only required if you have packer in your `opt` pack
local packer_exists = pcall(vim.cmd, [[packadd packer.nvim]])

if not packer_exists then
  if vim.fn.input("Download Packer? (y for yes)") ~= "y" then
    return
  end

  print("Downloading packer.nvim...")
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
  print("Downloaded packer.nvim")

  print("Reopen NVIM and run :PackerSync twice")

  return
end

return require('packer').startup {
  function(use)
    -- Packer can manage itself as an optional plugin
    use {'wbthomason/packer.nvim', opt = true}

    use { 'antoinemadec/FixCursorHold.nvim', config = function() require 'lt.plugins.fix-cursorhold' end}  -- Fix CursorHold Performance

    use 'tjdevries/astronauta.nvim'

    -- icons
    use 'kyazdani42/nvim-web-devicons'

    use { 'tpope/vim-fugitive', config = function() require 'lt.plugins.fugitive' end}
    use { 'lewis6991/gitsigns.nvim', config = function() require 'lt.plugins.gitsigns' end}

    -- use 'airblade/vim-rooter'
    use { 'ahmedkhalf/project.nvim', config = function() require 'lt.plugins.project' end}

    use 'mbbill/undotree' -- undo tree
    use { 'kevinhwang91/nvim-bqf', config = function() require 'lt.plugins.nvim-bqf' end}

    use { 'jdhao/better-escape.vim', config = function() require 'lt.plugins.better-escape' end}
    use { 'justinmk/vim-sneak', config = function() require 'lt.plugins.sneak' end}

    use 'b3nj5m1n/kommentary'

    use 'tpope/vim-surround' -- Change surrounding arks
    use 'tpope/vim-repeat' -- extends . repeat, for example for make it work with vim-sneak
    use { 'bkad/CamelCaseMotion', config = function() require 'lt.plugins.camelcasemotion' end}  -- allows to move by camelCase with w e
    use { 'glepnir/indent-guides.nvim', config = function() require 'lt.plugins.indent-guides' end}

    use {
      'nvim-telescope/telescope.nvim',
      requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
      config = function() require 'lt.plugins.telescope' end
    }
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

    use {'junegunn/fzf', run = './install --all' }     -- Fuzzy Searcher
    use {'junegunn/fzf.vim', config = function() require 'lt.plugins.fzf' end}

    use { 'dyng/ctrlsf.vim', config =  function() require 'lt.plugins.ctrlsf' end}
    use { 'norcalli/nvim-colorizer.lua', config = function() require 'lt.plugins.nvim-colorizer' end} -- preview hex colors

    use 'rrethy/vim-illuminate' -- highlight matching words when cursor on it
    use 'terryma/vim-expand-region'

    use 'gennaro-tedesco/nvim-peekup' -- shows register preview
    use 'numtostr/BufOnly.nvim' -- deletes all buffers except
    use 'psliwka/vim-smoothie' -- smoother scroll
    use 'romainl/vim-cool' -- disabled search highlight until next search
    use {
      'lazytanuki/nvim-mapper',
      config = function() require 'lt.plugins.nvim-mapper' end,
      before = "telescope.nvim"
    }

    use {
        "ThePrimeagen/refactoring.nvim",
        config = function() require 'lt.plugins.refactoring' end,
        requires = {
            {"nvim-lua/plenary.nvim"},
            {"nvim-treesitter/nvim-treesitter"}
        }
    }
    use { 'AndrewRadev/sideways.vim', config = function() require 'lt.plugins.sideways' end} -- allows to move functions parameter
    use { 'AndrewRadev/splitjoin.vim', config = function() require 'lt.plugins.splitjoin' end} -- allows to split one liner to multi lines

    use {
      'kyazdani42/nvim-tree.lua',
      config = function() require 'lt.plugins.nvim-tree' end
    }

    use 'tpope/vim-abolish' -- :S to replace with smartcase

    -- Autocomplete & Linters
    use 'neovim/nvim-lspconfig'
    use 'nvim-lua/lsp-status.nvim'
    use 'tjdevries/lsp_extensions.nvim'
    use 'glepnir/lspsaga.nvim'
    use 'onsails/lspkind-nvim'
    use 'ray-x/lsp_signature.nvim'

    use {
      'hrsh7th/nvim-compe', branch = 'master'
    }

    -- Snippets
    use { 'hrsh7th/vim-vsnip', config = function() require 'lt.plugins.snippets' end}  -- Fix CursorHold Performance
    use 'hrsh7th/vim-vsnip-integ'

    -- to download lsp servers
    -- TODO: check the tjdevries library
    use 'mattn/vim-lsp-settings'

    -- Language packs
    use {
      'nvim-treesitter/nvim-treesitter',
      config = function() require 'lt.plugins.treesitter' end,
      run = function() vim.cmd [[TSUpdate]] end
    }

    use 'haringsrob/nvim_context_vt' -- shows treesitter context in end of parenthesis

    use {
      'andymass/vim-matchup', -- enhances %
      config = function() require 'lt.plugins.vim-matchup' end
    }

    use {
      'folke/todo-comments.nvim',
      config = function() require 'lt.plugins.todo-comments' end
    }

    use {
      "vuki656/package-info.nvim",
      config = function() require 'lt.plugins.package-info' end
    } -- shows latest version on package.json files

    use {
      "vhyrro/neorg",
      config = function() require 'lt.plugins.neorg' end,
      requires = "nvim-lua/plenary.nvim"
  }


    -- Theming
    use 'gruvbox-community/gruvbox'

    -- status line
    use {'glepnir/galaxyline.nvim', config = function() require 'lt.plugins.galaxyline' end }
  end
}
