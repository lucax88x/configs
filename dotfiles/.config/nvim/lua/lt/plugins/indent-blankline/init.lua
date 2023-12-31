-- return {
--   "lukas-reineke/indent-blankline.nvim",
--   config = function()
--     local indent_blankline = require("indent_blankline")
--
--     indent_blankline.setup({
--       filetype_exclude = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy" },
--       bufname_exclude = { "" }, -- Disables the plugin in hover() popups and new files
--       use_treesitter = true,
--       show_current_context = true,
--       show_current_context_start = true,
--       context_patterns = {
--         -- NOTE: indent-blankline's defaults
--         "class",
--         "^func",
--         "method",
--         "^if",
--         "while",
--         "for",
--         "with",
--         "try",
--         "except",
--         "arguments",
--         "argument_list",
--         "object",
--         "dictionary",
--         "element",
--         "table",
--         "tuple",
--
--         -- NOTE: better JavaScript/TypeScript support
--         "return_statement",
--         "statement_block",
--       },
--     })
--   end,
-- }
return {
  "lukas-reineke/indent-blankline.nvim",
  event = { "BufReadPost", "BufNewFile" },
  main = "ibl",
  opts = {},
}
