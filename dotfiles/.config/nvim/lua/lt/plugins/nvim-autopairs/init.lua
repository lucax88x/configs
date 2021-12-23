local present, autopairs = pcall(require, "nvim-autopairs")

if not present then
	return
end

autopairs.setup()
