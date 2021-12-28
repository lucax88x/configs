local present, dap_install = pcall(require, "dap-install")

if not present then
	return
end

dap_install.setup({})
dap_install.config("chrome", {})

local r = require("lt.utils.remaps")

r.whick_key("<leader>ds", "servers")

r.nnoremap(
	"<leader>dsi",
	'<cmd>lua require("lt.plugins.dap-install.functions").dap_install_servers()<CR>',
	"dap",
	"dap_install_server",
	"Install DAP servers"
)

r.nnoremap("<leader>dsl", "<cmd>DIList<CR>", "dap", "dap_install_server_info", "DAP servers install info")
