local present, leap = pcall(require, "leap")

if not present then
	vim.notify("leap not found")
	return
end

leap.setup({
	case_insensitive = true,
})
leap.set_default_keymaps()
