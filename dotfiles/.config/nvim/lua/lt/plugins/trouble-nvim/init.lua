local present, trouble = pcall(require, "trouble")

if not present then
	return
end

trouble.setup({ use_diagnostic_signs = false })

local r = require("lt.utils.remaps")

r.noremap("n", "<leader>tc", "<cmd>TroubleClose<cr>", "lsp_trouble_close", "Closes Trouble")
