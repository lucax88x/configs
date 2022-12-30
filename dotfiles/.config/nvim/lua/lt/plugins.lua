return {
  "nvim-lua/plenary.nvim",

  require("lt.plugins.filetype"),
  require("lt.plugins.fix-cursor-hold"),
  require("lt.plugins.catppuccin"),

  -- notifications
  require("lt.plugins.notify"),

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
  require("lt.plugins.better-escape"),
  require("lt.plugins.which-key"),
  require("lt.plugins.hydra"),

  -- Change surrounding marks
  { "tpope/vim-surround" },
  -- extends . repeat
  { "tpope/vim-repeat" },
  -- allows to move by camelCase with w e
  require("lt.plugins.camel-case-motion"),

  -- highlight matching words when cursor on it
  "rrethy/vim-illuminate",
  -- disabled search highlight until next search
  "romainl/vim-cool",
  -- deletes all buffers except
  "numtostr/BufOnly.nvim",
  -- :S to replace with smartcase
  "tpope/vim-abolish",

  -- start screen & project management
  require("lt.plugins.alpha"),
  require("lt.plugins.project"),
  require("lt.plugins.neovim-session-manager"),

  -- scroll
  require("lt.plugins.neoscroll"),
  require("lt.plugins.scrollbar"),

  -- treesitter
  require("lt.plugins.treesitter"),
  require("lt.plugins.treesitter-playground"),

  -- git
  require("lt.plugins.fugitive"),
  require("lt.plugins.gitsigns"),

  -- quick list
  require("lt.plugins.bqf"),
  require("lt.plugins.diffview"),

  -- navigation
  require("lt.plugins.leap"),

  -- fuzzy finder
  require("lt.plugins.telescope"),

  -- search
  require("lt.plugins.ctrlsf"),
  require("lt.plugins.ssr"),
  require("lt.plugins.hlslens"),

  -- lsp
  require("lt.plugins.mason"),

  require("lt.plugins.lsp"),

  -- autocompletion
  require("lt.plugins.cmp"),
  require("lt.plugins.autopairs"),

  -- snippets
  require("lt.plugins.snippets"),

  -- comments & annotation
  require("lt.plugins.neogen"),
  require("lt.plugins.comment"),
  require("lt.plugins.todo-comments"),

  -- fold
  require("lt.plugins.ufo"),

  -- code helpers
  require("lt.plugins.rust-tools"),
  require("lt.plugins.quick-switcher"),
  require("lt.plugins.refactoring"),

  -- tree
  require("lt.plugins.tree"),

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
    dependencies = { "mfussenegger/nvim-dap" },
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    enabled = false,
    dependencies = { "mfussenegger/nvim-dap" },
    config = function()
      require("lt.plugins.nvim-dap-virtual-text")
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    enabled = false,
    dependencies = { "mfussenegger/nvim-dap" },
    config = function()
      require("lt.plugins.nvim-dap-ui")
    end,
  },
  {
    "Pocco81/DAPInstall.nvim",
    enabled = false,
    dependencies = { "mfussenegger/nvim-dap" },
    config = function()
      require("lt.plugins.dap-install")
    end,
  },

  -- ui
  require("lt.plugins.dressing"),
  require("lt.plugins.colorizer"),
  require("lt.plugins.modes"),
  require("lt.plugins.indent-blankline"),
  require("lt.plugins.fidget"),

  -- status bar
  require("lt.plugins.feline"),

  -- rest
  "mbbill/undotree",
  require("lt.plugins.startup-time"),
  require("lt.plugins.dial"),
  require("lt.plugins.truezen"),
  require("lt.plugins.peek"),

  --[[ { ]]
  --[[   "nvim-neorg/neorg", ]]
  --[[   build = ":Neorg sync-parsers", ]]
  --[[   ft = "norg", ]]
  --[[   config = function() ]]
  --[[     require("lt.plugins.neorg").setup() ]]
  --[[   end, ]]
  --[[ }, ]]
}
