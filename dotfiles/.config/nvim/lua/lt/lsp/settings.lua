local lsp = require('lspconfig')
local lsp_completion = require('completion')
local lsp_status  = require('lsp-status')
local diagnosticls  = require('lt.lsp.servers.diagnosticls')
local remaps  = require('lt.lsp.remaps')

-- for debugging lsp
-- vim.lsp.set_log_level("trace")

local function on_attach(client, bufnr)
    print(client.name) 
    remaps.set(client.server_capabilities, bufnr)
    lsp_status.on_attach(client, bufnr)
    lsp_completion.on_attach(client, bufnr)
end

lsp_status.register_progress()

local default_lsp_config = {on_attach = on_attach, capabilities = lsp_status.capabilities}
local language_server_path = vim.fn.stdpath("cache") .. "/lspconfig"

local servers = {
  diagnosticls = diagnosticls.options,
  bashls = require('lt.lsp.servers.bashls')(language_server_path),
  -- dockerls = {},
  yamlls = require('lt.lsp.servers.yamlls')(language_server_path),
  jsonls = require('lt.lsp.servers.jsonls')(language_server_path),
  -- rust_analyzer = {},
  tsserver = require('lt.lsp.servers.tsserver')(language_server_path, on_attach),
  html = require('lt.lsp.servers.htmlls')(language_server_path),
  cssls = require('lt.lsp.servers.cssls')(language_server_path),
  sumneko_lua = require('lt.lsp.servers.sumneko_lua')(language_server_path),
}

for server, config in pairs(servers) do
  lsp[server].setup(vim.tbl_deep_extend("force", default_lsp_config, config))
end
