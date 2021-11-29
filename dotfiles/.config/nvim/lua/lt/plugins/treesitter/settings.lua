
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
  playground = {
    enable = true,
    disable = {},
    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false, -- Whether the query persists across vim sessions
    keybindings = {
      toggle_query_editor = 'o',
      toggle_hl_groups = 'i',
      toggle_injected_languages = 't',
      toggle_anonymous_nodes = 'a',
      toggle_language_display = 'I',
      focus_language = 'f',
      unfocus_language = 'F',
      update = 'R',
      goto_node = '<cr>',
      show_help = '?',
    },
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection    = '<CR>',
      scope_incremental = '<CR>',
      node_incremental = '<TAB>',
      node_decremental = '<S-TAB>',

      --[[ init_selection = "zi",
      node_incremental = "zi",
      scope_incremental = "zo",
      node_decremental = "zd", ]]
    },
  },
  textobjects = {
      select = {
          enable = true,
          lookahead = true,
          -- The keymaps are defined in the configuration table, no way to get our Mapper in there !
          keymaps = {
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              ["ac"] = "@class.outer",
              ["ic"] = "@class.inner",

              -- xml attribute
              ["ax"] = "@attribute.outer",
              ["ix"] = "@attribute.inner",

              -- json
              ["ak"] = "@key.outer",
              ["ik"] = "@key.inner",
              ["av"] = "@value.outer",
              ["iv"] = "@value.inner",
          }
      },
      swap = {
        enable = true,
        swap_next = {
          ["<leader>rp"] = "@parameter.inner",
        },
        swap_previous = {
          ["<leader>rP"] = "@parameter.inner",
        },
      },
      move = {
        enable = true,
        set_jumps = true, -- whether to set jumps in the jumplist
        goto_next_start = {
          ["]m"] = "@function.outer",
          ["]]"] = "@class.outer",
        },
        goto_next_end = {
          ["]M"] = "@function.outer",
          ["]["] = "@class.outer",
        },
        goto_previous_start = {
          ["[m"] = "@function.outer",
          ["[["] = "@class.outer",
        },
        goto_previous_end = {
          ["[M"] = "@function.outer",
          ["[]"] = "@class.outer",
        },
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

nnoremap('<leader>tp', '<cmd>TSPlaygroundToggle<CR>', 'Treesitter', 'treesitter-playground',
         'Treesitter playground')
nnoremap('<leader>tt', '<cmd>TSHighlightCapturesUnderCursor<CR>', 'Treesitter', 'treesitter-highlight-under-cursor',
         'Shows highlight colors under cursor (theme)')

Mapper = require("nvim-mapper")

Mapper.map_virtual("o", "af", "", {}, "Navigation", "treesitter_function_outer", "Function outer motion")
Mapper.map_virtual("o", "if", "", {}, "Navigation", "treesitter_function_inner", "Function inner motion")
Mapper.map_virtual("o", "ac", "", {}, "Navigation", "treesitter_class_outer", "Class outer motion")
Mapper.map_virtual("o", "ic", "", {}, "Navigation", "treesitter_class_inner", "Class inner motion")

Mapper.map_virtual("o", "ax", "", {}, "Navigation", "treesitter_attribute_outer", "Attribute (html, xml) outer motion")
Mapper.map_virtual("o", "ix", "", {}, "Navigation", "treesitter_attribute_inner", "Attribute (html, xml) inner motion")

Mapper.map_virtual("o", "ak", "", {}, "Navigation", "treesitter_key_outer", "Json key outer motion")
Mapper.map_virtual("o", "ik", "", {}, "Navigation", "treesitter_key_inner", "Json key inner motion")

Mapper.map_virtual("o", "av", "", {}, "Navigation", "treesitter_value_outer", "Json value outer motion")
Mapper.map_virtual("o", "iv", "", {}, "Navigation", "treesitter_value_inner", "Json value inner motion")

Mapper.map_virtual("o", "<leader>rp", "", {}, "Navigation", "treesitter_swap_parameter_next", "Swap parameter to next")
Mapper.map_virtual("o", "<leader>rP", "", {}, "Navigation", "treesitter_swap_parameter_previous", "Swap parameter to previous")

Mapper.map_virtual("o", "]m", "", {}, "Navigation", "treesitter_next_function_start", "Go to next function (start)")
Mapper.map_virtual("o", "]M", "", {}, "Navigation", "treesitter_next_function_end", "Go to next function (end)")

Mapper.map_virtual("o", "]]", "", {}, "Navigation", "treesitter_next_class_start", "Go to next class (start)")
Mapper.map_virtual("o", "][", "", {}, "Navigation", "treesitter_next_class_end", "Go to next class (end)")

Mapper.map_virtual("o", "[m", "", {}, "Navigation", "treesitter_previous_function_start", "Go to previous function (start)")
Mapper.map_virtual("o", "[M", "", {}, "Navigation", "treesitter_previous_function_end", "Go to previous function (end)")

Mapper.map_virtual("o", "[[", "", {}, "Navigation", "treesitter_previous_class_start", "Go to previous class (start)")
Mapper.map_virtual("o", "[]", "", {}, "Navigation", "treesitter_previous_class_end", "Go to previous class (end)")

Mapper.map_virtual("o", "zi", "", {}, "Navigation", "treesitter_init_selection", "Init selection")
Mapper.map_virtual("o", "zi", "", {}, "Navigation", "treesitter_increment_node", "Expand node")
Mapper.map_virtual("o", "zo", "", {}, "Navigation", "treesitter_increment_scope", "Expand scope")
Mapper.map_virtual("o", "zI", "", {}, "Navigation", "treesitter_decrement_node", "Decrement scope")
