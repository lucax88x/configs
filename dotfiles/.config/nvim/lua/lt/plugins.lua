return {
  "nvim-lua/plenary.nvim",

  require("lt.plugins.fix-cursor-hold"),
  require("lt.plugins.catppuccin"),

  -- notifications
  require("lt.plugins.notify"),

  -- icons
  {
    "nvim-tree/nvim-web-devicons",
    event = "VeryLazy",
  },

  -- ui library
  {
    "MunifTanjim/nui.nvim",
    event = "VeryLazy",
  },
  require("lt.plugins.noice"),
  require("lt.plugins.dressing"),

  -- shortcuts
  require("lt.plugins.better-escape"),
  require("lt.plugins.which-key"),
  require("lt.plugins.hydra"),

  -- Change surrounding marks
  require("lt.plugins.surround"),

  -- extends . repeat
  { "tpope/vim-repeat", event = "VeryLazy" },
  -- allows to move by camelCase with w e
  require("lt.plugins.camel-case-motion"),

  -- highlight matching words when cursor on it
  require("lt.plugins.illuminate"),
  -- disabled search highlight until next search
  { "romainl/vim-cool", event = "VeryLazy" },
  require("lt.plugins.bufremove"),
  -- :S to replace with smartcase
  { "tpope/vim-abolish", event = "VeryLazy" },

  -- start screen & project management
  require("lt.plugins.alpha"),
  require("lt.plugins.project"),
  require("lt.plugins.session-manager"),

  -- scroll
  --[[ require("lt.plugins.neoscroll"), ]]
  require("lt.plugins.scrollbar"),

  -- treesitter
  require("lt.plugins.treesitter"),
  require("lt.plugins.mini-ai"),

  -- git
  require("lt.plugins.fugitive"),
  require("lt.plugins.gitsigns"),

  -- quick list
  require("lt.plugins.bqf"),
  require("lt.plugins.diffview"),

  -- navigation
  --[[ require("lt.plugins.leap"), ]]
  require("lt.plugins.hop"),

  -- fuzzy finder
  require("lt.plugins.telescope"),

  -- search
  require("lt.plugins.ctrlsf"),
  require("lt.plugins.ssr"),
  require("lt.plugins.hlslens"),
  require("lt.plugins.spectre"),

  -- lsp
  require("lt.plugins.mason"),
  require("lt.plugins.mason-tool"),
  require("lt.plugins.mason-dap"),
  require("lt.plugins.mason-null-ls"),

  require("lt.plugins.lsp"),

  -- autocompletion
  require("lt.plugins.cmp"),
  require("lt.plugins.autopairs"),

  -- snippets
  require("lt.plugins.snippets"),

  -- comments & annotation
  require("lt.plugins.neogen"),
  require("lt.plugins.mini-comment"),
  require("lt.plugins.todo-comments"),

  -- fold
  require("lt.plugins.ufo"),

  -- code helpers
  require("lt.plugins.rust-tools"),
  require("lt.plugins.quick-switcher"),
  require("lt.plugins.refactoring"),

  -- tree
  require("lt.plugins.tree"),

  -- tests
  require("lt.plugins.neotest"),

  -- debugging
  require("lt.plugins.dap"),
  require("lt.plugins.dap-ui"),
  require("lt.plugins.dap-virtual-text"),

  -- ui
  require("lt.plugins.colorizer"),
  require("lt.plugins.modes"),
  require("lt.plugins.indent-blankline"),
  --[[ require("lt.plugins.fidget"), ]]
  require("lt.plugins.no-neck-pain"),
  require("lt.plugins.recorder"),
  require("lt.plugins.inc_rename"),

  -- status bar
  require("lt.plugins.lualine"),
  require("lt.plugins.statuscol"),

  -- rest
  "mbbill/undotree",
  require("lt.plugins.startup-time"),
  require("lt.plugins.dial"),
  require("lt.plugins.truezen"),
  require("lt.plugins.peek"),
  require("lt.plugins.import-cost"),

  -- require("lt.plugins.profile"),

  --[[ { ]]
  --[[   "nvim-neorg/neorg", ]]
  --[[   build = ":Neorg sync-parsers", ]]
  --[[   ft = "norg", ]]
  --[[   config = function() ]]
  --[[     require("lt.plugins.neorg").setup() ]]
  --[[   end, ]]
  --[[ }, ]]
}
