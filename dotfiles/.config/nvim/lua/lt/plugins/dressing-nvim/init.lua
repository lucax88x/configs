local present, dressing = pcall(require, "dressing")

if not present then
	return
end

dressing.setup({})
