local present, indent_blankline = pcall(require, "indent_blankline")

if not present then
	return
end

indent_blankline.setup({
	filetype_exclude = { "alpha", "lsp-installer", "packer" },
	show_current_context = true,
	show_current_context_start = true, -- underline first line
	use_treesitter = true,
})
