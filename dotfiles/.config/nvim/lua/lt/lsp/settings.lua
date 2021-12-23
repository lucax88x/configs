local lsp_installer_servers = require("nvim-lsp-installer.servers")
local remaps = require("lt.lsp.remaps")

local presentLspStatus, lspStatus = pcall(require, "lsp-status")
local presentCmpNvimLsp, cmpNvimLsp = pcall(require, "cmp_nvim_lsp")
local presentAerial, aerial = pcall(require, "aerial")
local presentLspSignature, lspSignature = pcall(require, "lsp_signature")

vim.lsp.set_log_level("error") -- 'trace', 'debug', 'info', 'warn', 'error'

local function on_attach(client, bufnr)
	-- print(client.name)
	remaps.set_default_on_buffer(client, bufnr)

	if presentLspStatus then
		lspStatus.on_attach(client, bufnr)
	end

	if presentAerial then
		aerial.on_attach(client, bufnr)
	end

	if presentLspSignature then
		lspSignature.on_attach({ floating_window = false, timer_interval = 500 })
	end
end

vim.diagnostic.config({
	virtual_text = { spacing = 0, prefix = "■" },
	signs = true,
	update_in_insert = false,
})

local capabilities = vim.lsp.protocol.make_client_capabilities()

if presentLspStatus then
	lspStatus.register_progress()
	capabilities = vim.tbl_extend("keep", capabilities, lspStatus.capabilities)
end

if presentCmpNvimLsp then
	capabilities = vim.tbl_extend("keep", capabilities, cmpNvimLsp.update_capabilities(capabilities))
end

local servers = {
	efm = require("lt.lsp.servers.efm")(),
	bashls = {},
	yamlls = require("lt.lsp.servers.yamlls")(capabilities),
	jsonls = require("lt.lsp.servers.jsonls")(capabilities),
	tsserver = require("lt.lsp.servers.tsserver")(on_attach),
	html = {},
	cssls = {},
	sumneko_lua = require("lt.lsp.servers.sumneko_lua")(),
	dockerls = {},
	csharp_ls = {},
	vuels = {},
	graphql = {},
	rust_analyzer = {},
	eslint = {},
}

local default_lsp_config = {
	on_attach = on_attach,
	capabilities = capabilities,
	flags = { debounce_text_changes = 200 },
}

for serverName, config in pairs(servers) do
	local ok, server = lsp_installer_servers.get_server(serverName)
	if ok then
		if not server:is_installed() then
			print("installing " .. serverName)
			server:install()
		end
	end

	local merged_config = vim.tbl_deep_extend("force", default_lsp_config, config)

	if server.name == "rust_analyzer" then
		local default_server_lsp_config = server:get_default_options()
		merged_config = vim.tbl_deep_extend("force", default_server_lsp_config, merged_config)

		local present, rust_tools = pcall(require, "rust-tools")

		if present then
			rust_tools.setup({ server = merged_config })
			server:attach_buffers()
		else
			print("normal setup")
			server:setup(merged_config)
		end
	else
		server:setup(merged_config)
	end
end
