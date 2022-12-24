return {
  "nvim-lua/plenary.nvim",

  {
    "nathom/filetype.nvim",
    config = function()
      require("lt.plugins.filetype")
    end,
  },
  {
    "antoinemadec/FixCursorHold.nvim",
    config = function()
      require("lt.plugins.fix-cursorhold")
    end,
  },
  {
    "catppuccin/nvim",
    config = function()
      require("lt.plugins.catppuccin-theme")
    end,
  },

  -- notifications
  {
    "rcarriga/nvim-notify",
    config = function()
      require("lt.plugins.nvim-notify")
    end,
  },

  -- icons
  {
    "kyazdani42/nvim-web-devicons",
    event = "VeryLazy",
  },

  -- ui library
  {
    "MunifTanjim/nui.nvim",
    event = "VeryLazy",
  },

  -- shortcuts
  {
    "jdhao/better-escape.vim",
    config = function()
      require("lt.plugins.better-escape")
    end,
  },
  {
    "folke/which-key.nvim",
    lazy = true,
    config = function()
      require("lt.plugins.which-key")
    end,
  },
  {
    "anuvyklack/hydra.nvim",
    config = function()
      require("lt.plugins.hydra")
    end,
    event = "VeryLazy",
  },
  -- Change surrounding arks
  { "tpope/vim-surround" },
  -- extends . repeat
  { "tpope/vim-repeat" },
  -- allows to move by camelCase with w e
  {
    "bkad/CamelCaseMotion",
    config = function()
      require("lt.plugins.camelcasemotion")
    end,
  },
  -- highlight matching words when cursor on it
  "rrethy/vim-illuminate",
  -- disabled search highlight until next search
  "romainl/vim-cool",
  -- deletes all buffers except
  "numtostr/BufOnly.nvim",
  -- :S to replace with smartcase
  "tpope/vim-abolish",

  -- start screen & project management
  {
    "goolord/alpha-nvim",
    config = function()
      require("lt.plugins.alpha")
    end,
    event = "BufWinEnter",
  },
  {
    "ahmedkhalf/project.nvim",
    config = function()
      require("lt.plugins.project")
    end,
  },
  {
    "shatur/neovim-session-manager",
    config = function()
      require("lt.plugins.neovim-session-manager")
    end,
  },

  -- scroll
  {
    "karb94/neoscroll.nvim",
    config = function()
      require("lt.plugins.neoscroll")
    end,
  },
  {
    "petertriho/nvim-scrollbar",
    config = function()
      require("lt.plugins.nvim-scrollbar")
    end,
  },

  -- treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("lt.plugins.treesitter")
    end,
    run = function()
      vim.cmd([[TSUpdate]])
    end,
  },
  "nvim-treesitter/playground",
  "JoosepAlviste/nvim-ts-context-commentstring",

  -- shows treesitter context in end of parenthesis
  "haringsrob/nvim_context_vt",
  "RRethy/nvim-treesitter-textsubjects",
  "nvim-treesitter/nvim-treesitter-textobjects",

  -- git
  {
    "tpope/vim-fugitive",
    config = function()
      require("lt.plugins.fugitive")
    end,
    event = "VeryLazy",
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("lt.plugins.gitsigns")
    end,
    event = "BufWinEnter",
  },

  -- quick list
  {
    "kevinhwang91/nvim-bqf",
    config = function()
      require("lt.plugins.nvim-bqf")
    end,
    event = "VeryLazy",
  },
  {
    "sindrets/diffview.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("lt.plugins.diffview-nvim")
    end,
    event = "VeryLazy",
  },

  -- navigation
  "ggandor/leap.nvim",
  {
    "ggandor/flit.nvim",
    requires = "ggandor/leap.nvim",
    config = function()
      require("lt.plugins.leap-nvim")
    end,
  },

  -- fuzzy finder
  "nvim-telescope/telescope-fzf-native.nvim",
  "nvim-telescope/telescope-ui-select.nvim",
  {
    "nvim-telescope/telescope.nvim",
    requires = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
      { "nvim-telescope/telescope-ui-select.nvim" },
    },
    config = function()
      require("lt.plugins.telescope")
    end,
  },

  -- search
  {
    "dyng/ctrlsf.vim",
    config = function()
      require("lt.plugins.ctrlsf")
    end,
  },
  {
    "cshuaimin/ssr.nvim",
    config = function()
      require("lt.plugins.nvim-ssr")
    end,
  },
  {
    "kevinhwang91/nvim-hlslens",
    config = function()
      require("lt.plugins.nvim-hlslens")
    end,
  },

  -- lsp
  "williamboman/mason.nvim",
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    config = function()
      require("lt.plugins.mason")
    end,
    requires = "williamboman/mason.nvim",
  },
  { "williamboman/mason-lspconfig.nvim", requires = "williamboman/mason.nvim" },
  { "neovim/nvim-lspconfig", requires = "williamboman/mason-lspconfig.nvim" },
  "nvim-lua/lsp-status.nvim",
  "jose-elias-alvarez/typescript.nvim",
  "b0o/schemastore.nvim",
  "jose-elias-alvarez/null-ls.nvim",
  {
    url = "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    config = function()
      require("lt.plugins.lsp_lines")
    end,
  },

  -- autocompletion
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lua",
      "windwp/nvim-autopairs",
      "onsails/lspkind-nvim",
    },
    config = function()
      require("lt.plugins.nvim-cmp")
    end,
  },
  {
    "windwp/nvim-autopairs",
    config = function()
      require("lt.plugins.nvim-autopairs")
    end,
  },

  -- snippets
  {
    "L3MON4D3/LuaSnip",
    requires = { "rafamadriz/friendly-snippets" },
    config = function()
      require("lt.plugins.snippets")
    end,
    event = "InsertEnter",
  },
  "rafamadriz/friendly-snippets",

  -- comments & annotation
  {
    "danymat/neogen",
    config = function()
      require("lt.plugins.neogen")
    end,
    requires = "nvim-treesitter/nvim-treesitter",
    event = "VeryLazy",
  },
  {
    "numToStr/Comment.nvim",
    config = function()
      require("lt.plugins.comment-nvim")
    end,
    event = "VeryLazy",
  },
  {
    "folke/todo-comments.nvim",
    config = function()
      require("lt.plugins.todo-comments")
    end,
    event = "VeryLazy",
  },

  -- fold
  {
    "kevinhwang91/nvim-ufo",
    requires = "kevinhwang91/promise-async",
  },
  "kevinhwang91/promise-async",

  -- code helpers
  {
    "simrat39/rust-tools.nvim",
    ft = "rs",
    requires = "nvim-lua/plenary.nvim",
  },
  {
    "Everduin94/nvim-quick-switcher",
    config = function()
      require("lt.plugins.quick-switcher")
    end,
    event = "VeryLazy",
  },
  {
    "bennypowers/nvim-regexplainer",
    config = function()
      require("lt.plugins.regexplainer")
    end,
    requires = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
    event = "VeryLazy",
  },
  {
    "ThePrimeagen/refactoring.nvim",
    config = function()
      require("lt.plugins.refactoring")
    end,
    requires = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-treesitter/nvim-treesitter" },
    },
  },

  -- tree
  {
    "kyazdani42/nvim-tree.lua",
    config = function()
      require("lt.plugins.nvim-tree")
    end,
    keys = { "-" },
  },

  -- debugging
  {
    "mfussenegger/nvim-dap",
    enabled = false,
    config = function()
      require("lt.plugins.nvim-dap")
    end,
  },
  {
    "nvim-telescope/telescope-dap.nvim",
    enabled = false,
    requires = { "mfussenegger/nvim-dap" },
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    enabled = false,
    requires = { "mfussenegger/nvim-dap" },
    config = function()
      require("lt.plugins.nvim-dap-virtual-text")
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    enabled = false,
    requires = { "mfussenegger/nvim-dap" },
    config = function()
      require("lt.plugins.nvim-dap-ui")
    end,
  },
  {
    "Pocco81/DAPInstall.nvim",
    enabled = false,
    requires = { "mfussenegger/nvim-dap" },
    config = function()
      require("lt.plugins.dap-install")
    end,
  },

  -- ui
  {
    "stevearc/dressing.nvim",
    config = function()
      require("lt.plugins.dressing-nvim")
    end,
  },
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("lt.plugins.nvim-colorizer")
    end,
  },
  {
    "mvllow/modes.nvim",
    config = function()
      require("lt.plugins.modes")
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("lt.plugins.indent-blankline")
    end,
  },
  {
    "j-hui/fidget.nvim",
    config = function()
      require("lt.plugins.fidget-nvim")
    end,
  },

  -- status bar

  {
    "SmiteshP/nvim-navic",
    requires = "neovim/nvim-lspconfig",
  },
  {
    "feline-nvim/feline.nvim",
    requires = "SmiteshP/nvim-navic",
    config = function()
      require("lt.plugins.feline")
    end,
  },

  -- rest
  {
    "mbbill/undotree",
  },
  {
    "dstein64/vim-startuptime",
    -- lazy-load on a command
    cmd = "StartupTime",
  },
  {
    "monaqa/dial.nvim",
    config = function()
      require("lt.plugins.dial")
    end,
    keys = { "<C-a>", "<C-x>" },
  },

  {
    "Pocco81/true-zen.nvim",
    config = function()
      require("lt.plugins.truezen")
    end,
    keys = { "<leader>Z" },
  },

  -- {
  --   "nvim-neorg/neorg",
  --   -- lazy-load on filetype
  --   ft = "norg",
  --   -- custom config that will be executed when loading the plugin
  --   config = function()
  --     require("neorg").setup()
  --   end,
  -- },
  --
}
