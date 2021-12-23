local present, aerial = pcall(require, "aerial")

if not present then
	return
end

vim.g.aerial = {
	-- Enum: prefer_right, prefer_left, right, left
	-- Determines the default direction to open the aerial window. The 'prefer'
	-- options will open the window in the other direction *if* there is a
	-- different buffer in the way of the preferred direction
	default_direction = "left",
}

aerial.register_attach_cb(function(bufnr)
	-- Jump forwards/backwards with '{' and '}'
	vim.api.nvim_buf_set_keymap(bufnr, "n", "{", "<cmd>AerialPrev<CR>", {})
	vim.api.nvim_buf_set_keymap(bufnr, "n", "}", "<cmd>AerialNext<CR>", {})
	-- Jump up the tree with '[[' or ']]'
	vim.api.nvim_buf_set_keymap(bufnr, "n", "[[", "<cmd>AerialPrevUp<CR>", {})
	vim.api.nvim_buf_set_keymap(bufnr, "n", "]]", "<cmd>AerialNextUp<CR>", {})
end)
