local present, dap_ui = pcall(require, "dapui")

if not present then
	return
end

dap_ui.setup({})

local r = require("lt.utils.remaps")

r.noremap("n", "<leader>du", dap_ui.toggle, "Toggle DAP UI")
