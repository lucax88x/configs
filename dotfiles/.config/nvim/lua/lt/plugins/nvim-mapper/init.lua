local present, nvim_mapper = pcall(require, "nvim-mapper")

if not present then
	return
end

nvim_mapper.setup({
	no_map = false,
})
