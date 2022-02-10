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

r.which_key("<leader>z", "zen")

r.noremap("n", "<leader>zz", "<cmd>:TZAtaraxis<CR>", "zen", "Zen")
