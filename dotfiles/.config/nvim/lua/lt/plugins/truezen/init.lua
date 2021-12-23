local present, true_zen = pcall(require, "true-zen")

if not present then
	return
end

true_zen.setup({
	integrations = {
		gitsigns = true,
	},
})

local r = require("lt.utils.remaps")

r.nnoremap("<leader>zz", "<cmd>:TZAtaraxis<CR>", "zen", "zen", "Zen")
