local present, trouble = pcall(require, "trouble")

if not present then
	return
end

trouble.setup({ use_diagnostic_signs = false })

local r = require("lt.utils.remaps")

r.nnoremap("<leader>tc", "<cmd>TroubleClose<cr>", "lsp", "lsp_trouble_close", "Closes Trouble")
