local present, dap_ui = pcall(require, "dapui")

if not present then
	return
end

dap_ui.setup({})

local r = require("lt.utils.remaps")

r.nnoremap("<leader>du", '<cmd>lua require"dapui".toggle()<CR>', "dap", "dap_ui_toggle", "Toggle DAP UI")
