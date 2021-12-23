local present, nvim_gps = pcall(require, "nvim-gps")

if not present then
	return
end

nvim_gps.setup({})
