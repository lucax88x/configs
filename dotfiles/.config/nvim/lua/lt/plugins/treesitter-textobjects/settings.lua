Mapper = require("nvim-mapper")

require("nvim-treesitter.configs").setup {
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
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "zi",
      node_incremental = "zi",
      scope_incremental = "zo",
      node_decremental = "zd",
    },
  },
  highlight = {
    enable = true,
  },
}

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
