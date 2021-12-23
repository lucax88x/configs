local present, nvim_mapper = pcall(require, "nvim-mapper")

if not present then
	return
end

--  <leader>MM
nvim_mapper.setup({})

