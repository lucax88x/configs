local present, treesitter = pcall(require, "nvim-treesitter.configs")

if not present then
  return
end

treesitter.setup({
  ensure_installed = {
    "typescript",
    "html",
    "tsx",
    "lua",
    "json",
    "rust",
    "css",
    "scss",
    "ruby",
    "rasi",
    "javascript",
    "dockerfile",
    "bash",
    "c_sharp",
    "graphql",
    "vue",
    "svelte",
    "regex",
    "yaml",
  },
  highlight = {
    enable = true,
  },
  matchup = {
    enable = true,
  },
  playground = {
    enable = true,
    disable = {},
    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false, -- Whether the query persists across vim sessions
    keybindings = {
      toggle_query_editor = "o",
      toggle_hl_groups = "i",
      toggle_injected_languages = "t",
      toggle_anonymous_nodes = "a",
      toggle_language_display = "I",
      focus_language = "f",
      unfocus_language = "F",
      update = "R",
      goto_node = "<cr>",
      show_help = "?",
    },
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<CR>",
      scope_incremental = "<CR>",
      node_incremental = "<TAB>",
      node_decremental = "<S-TAB>",

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
      },
    },
    swap = {
      enable = true,
      swap_next = {
        ["<leader>fpp"] = "@parameter.inner",
      },
      swap_previous = {
        ["<leader>fpP"] = "@parameter.inner",
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
      ["."] = "textsubjects-smart",
      [";"] = "textsubjects-container-outer",
    },
  },
})

local r = require("lt.utils.remaps")

r.which_key("<leader>dt", "Treesitter")

r.noremap("n", "<leader>dtp", "<cmd>TSPlaygroundToggle<CR>", "Treesitter playground")
r.noremap("n", "<leader>dtt", "<cmd>TSHighlightCapturesUnderCursor<CR>", "Shows highlight colors under cursor")
r.map_virtual("af", "Function outer motion")
r.map_virtual("if", "Function inner motion")
r.map_virtual("ac", "Class outer motion")
r.map_virtual("ic", "Class inner motion")

r.map_virtual("ax", "Attribute (html, xml) outer motion")
r.map_virtual("ix", "Attribute (html, xml) inner motion")

r.map_virtual("ak", "Json key outer motion")
r.map_virtual("ik", "Json key inner motion")

r.map_virtual("av", "Json value outer motion")
r.map_virtual("iv", "Json value inner motion")

r.which_key("fp", "parameters")

r.map_virtual("<leader>fpp", "Swap parameter to next")
r.map_virtual("<leader>fpP", "Swap parameter to previous")

r.map_virtual("]m", "Go to next function (start)")
r.map_virtual("]M", "Go to next function (end)")

r.map_virtual("]]", "Go to next class (start)")
r.map_virtual("][", "Go to next class (end)")

r.map_virtual("[m", "Go to previous function (start)")
r.map_virtual("[M", "Go to previous function (end)")

r.map_virtual("[[", "Go to previous class (start)")
r.map_virtual("[]", "Go to previous class (end)")

r.map_virtual("zi", "Init selection")
r.map_virtual("zi", "Expand node")
r.map_virtual("zo", "Expand scope")
r.map_virtual("zI", "Decrement scope")
