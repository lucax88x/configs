local present, notify = pcall(require, "notify")

if not present then
	return
end

notify.setup({
	stages = "fade",
})

vim.notify = notify
