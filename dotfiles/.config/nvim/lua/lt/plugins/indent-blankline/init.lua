local present, indent_blankline = pcall(require, "indent_blankline")

if not present then
  return
end

indent_blankline.setup({
  filetype_exclude = { "alpha", "lsp-installer", "packer" },
  bufname_exclude = { "" }, -- Disables the plugin in hover() popups and new files
  use_treesitter = true,
  show_current_context = true,
  show_current_context_start = true,
  context_patterns = {
    -- NOTE: indent-blankline's defaults
    "class",
    "^func",
    "method",
    "^if",
    "while",
    "for",
    "with",
    "try",
    "except",
    "arguments",
    "argument_list",
    "object",
    "dictionary",
    "element",
    "table",
    "tuple",

    -- NOTE: better JavaScript/TypeScript support
    "return_statement",
    "statement_block",
  },
})
