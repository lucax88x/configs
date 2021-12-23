local r = require("lt.utils.remaps")

r.nnoremap(
	"<leader>flu",
	'<cmd>lua require("lt.lsp.servers.functions").lsp_install_servers()<CR>',
	"lsp",
	"lsp_install_server",
	"Installer LSP servers"
)

r.nnoremap("<leader>fll", "<cmd>LspInstallInfo<CR>", "lsp", "lsp_install_server_info", "LSP servers install info")
