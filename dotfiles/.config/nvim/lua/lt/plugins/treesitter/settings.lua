-- neorg treesitter
local parser_configs = require('nvim-treesitter.parsers').get_parser_configs()

parser_configs.norg = {
    install_info = {
        url = "https://github.com/vhyrro/tree-sitter-norg",
        files = { "src/parser.c" },
        branch = "main"
    },
}
-- end neorgtreesitter

local treesitter = require'nvim-treesitter.configs'

treesitter.setup {
  ensure_installed = {"typescript", "html", "tsx", "lua", "json", "rust", "css", "javascript", "c_sharp", "norg", "graphql"},
  highlight = {
    enable = true,
  },
  matchup = {
    enable = true
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection    = '<CR>',
      scope_incremental = '<CR>',
      node_incremental = '<TAB>',
      node_decremental = '<S-TAB>',
    },
  },
  textsubjects = {
      enable = true,
      keymaps = {
          ['.'] = 'textsubjects-smart',
          [';'] = 'textsubjects-container-outer',
      }
  },
}
