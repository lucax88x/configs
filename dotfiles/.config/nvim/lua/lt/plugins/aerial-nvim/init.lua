local present, aerial = pcall(require, "aerial")

if not present then
	return
end

aerial.setup({
	default_direction = "left",
	on_attach = function(bufnr)
		vim.api.nvim_buf_set_keymap(bufnr, "n", "q", "<cmd>AerialToggle!<CR>", {})
		vim.api.nvim_buf_set_keymap(bufnr, "n", "{", "<cmd>AerialPrev<CR>", {})
		vim.api.nvim_buf_set_keymap(bufnr, "n", "}", "<cmd>AerialNext<CR>", {})
		vim.api.nvim_buf_set_keymap(bufnr, "n", "[[", "<cmd>AerialPrevUp<CR>", {})
		vim.api.nvim_buf_set_keymap(bufnr, "n", "]]", "<cmd>AerialNextUp<CR>", {})
	end,
})

