local present, renamer = pcall(require, "renamer")

if not present then
	return
end

renamer.setup({
	title = "",
})
