local present, _ = pcall(require, "lspconfig")
if not present then
	return
end

local present_lsp_installer, lsp_installer = pcall(require, "nvim-lsp-installer.servers")
if not present_lsp_installer then
	return
end

local vim = vim

require("lt.lsp.null-ls")
local remaps = require("lt.lsp.remaps")

local presentLspStatus, lspStatus = pcall(require, "lsp-status")
local presentCmpNvimLsp, cmpNvimLsp = pcall(require, "cmp_nvim_lsp")
local presentAerial, aerial = pcall(require, "aerial")
local presentLspSignature, lspSignature = pcall(require, "lsp_signature")

vim.lsp.set_log_level("error") -- 'trace', 'debug', 'info', 'warn', 'error'

local function on_attach(client, bufnr)
	-- print(client.name)
	-- require("lt.utils.functions").tprint_keys(client.server_capabilities)
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

local signs = {
	{ name = "DiagnosticSignError", text = "" },
	{ name = "DiagnosticSignWarn", text = "" },
	{ name = "DiagnosticSignHint", text = "" },
	{ name = "DiagnosticSignInfo", text = "" },
}

for _, sign in ipairs(signs) do
	vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

local config = {
	virtual_text = true,
	-- show signs
	signs = {
		active = signs,
	},
	update_in_insert = true,
	underline = true,
	severity_sort = true,
	float = {
		focus = false,
		focusable = false,
		style = "minimal",
		border = "rounded",
		source = "always",
		header = "",
		prefix = "",
	},
}

vim.diagnostic.config(config)

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
	border = "rounded",
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
	border = "rounded",
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
	bashls = {},
	yamlls = require("lt.lsp.servers.yamlls")(capabilities),
	jsonls = require("lt.lsp.servers.jsonls")(capabilities),
	html = {},
	cssls = {},
	sumneko_lua = require("lt.lsp.servers.sumneko_lua")(),
	dockerls = {},
	csharp_ls = {},
	vuels = {},
	graphql = {},
	rust_analyzer = {},
	eslint = {},
	tsserver = require("lt.lsp.servers.tsserver")(on_attach),
	svelte = {},
	texlab = {},
}

local default_lsp_config = {
	on_attach = on_attach,
	capabilities = capabilities,
	flags = {
		debounce_text_changes = 200,
		allow_incremental_sync = true,
	},
}

for server_name, server_config in pairs(servers) do
	local server_installed, server = lsp_installer.get_server(server_name)
	if server_installed then
		server:on_ready(function()
			local merged_config = vim.tbl_deep_extend("force", default_lsp_config, server_config)

			if server.name == "rust_analyzer" then
				local default_server_lsp_config = server:get_default_options()
				merged_config = vim.tbl_deep_extend("force", default_server_lsp_config, merged_config)

				local present_rust_tools, rust_tools = pcall(require, "rust-tools")

				if present_rust_tools then
					rust_tools.setup({ server = merged_config })
					server:attach_buffers()
				else
					server:setup(merged_config)
				end
			else
				server:setup(merged_config)
			end
		end)
		if not server:is_installed() then
			server:install()
		end
	end
end
