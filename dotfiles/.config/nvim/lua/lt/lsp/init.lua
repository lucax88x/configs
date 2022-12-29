local present, lspconfig = pcall(require, "lspconfig")
if not present then
  return
end

local vim = vim
require("lt.lsp.null-ls")
local remaps = require("lt.lsp.remaps")

local presentLspStatus, lspStatus = pcall(require, "lsp-status")
local presentCmpNvimLsp, cmpNvimLsp = pcall(require, "cmp_nvim_lsp")
local presentLspSignature, lspSignature = pcall(require, "lsp_signature")
local presentNavic, navic = pcall(require, "nvim-navic")
local presentUfo = pcall(require, "ufo")
local ufo = require("lt.plugins.ufo.setup")

vim.lsp.set_log_level("error") -- 'trace', 'debug', 'info', 'warn', 'error'

local function try_attach_navic(client, bufnr)
  if presentNavic then
    local filetype = vim.api.nvim_buf_get_option(bufnr or 0, "filetype")

    if client.server_capabilities.documentSymbolProvider then
      if client.name == "graphql" then
        if filetype == "typescript" or filetype == "typescriptreact" or filetype == "javascript" then
          return
        end
      end

      if client.name == "eslint" or client.name == "angularls" or client.name == "null-ls" then
        return
      end

      vim.notify("attach navic to " .. client.name)
      navic.attach(client, bufnr)
    end
  end
end

local function on_attach(client, bufnr)
  -- print(client.name)
  -- require("lt.utils.functions").tprint_keys(client.server_capabilities)
  remaps.set_default_on_buffer(client, bufnr)

  if presentLspStatus then
    lspStatus.on_attach(client)
  end

  if presentLspSignature then
    lspSignature.on_attach({ floating_window = false, timer_interval = 500 })
  end

  try_attach_navic(client, bufnr)

  if client.name == "tsserver" then
    -- let prettier format
    client.server_capabilities.document_formatting = false
    client.server_capabilities.documentFormattingProvider = false
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
  -- enables lsp_lines but we want to start disabled
  virtual_lines = false,
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

local capabilities

if presentCmpNvimLsp then
  capabilities = cmpNvimLsp.default_capabilities()
else
  capabilities = vim.lsp.protocol.make_client_capabilities()
end

if presentLspStatus then
  lspStatus.register_progress()
  capabilities = vim.tbl_extend("keep", capabilities, lspStatus.capabilities)
end

if presentUfo then
  capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true,
  }
end

local servers = {
  bashls = {},
  yamlls = require("lt.lsp.servers.yamlls")(capabilities),
  jsonls = require("lt.lsp.servers.jsonls")(capabilities),
  html = {},
  cssls = {},
  sumneko_lua = require("lt.lsp.servers.sumneko_lua")(on_attach),
  dockerls = {},
  -- csharp_ls = {},
  omnisharp = {},
  vuels = {},
  graphql = {},
  -- rust_analyzer = {},
  eslint = require("lt.lsp.servers.eslint")(on_attach),
  -- svelte = {},
  texlab = {},
  ansiblels = {},
  angularls = {},
  gopls = {},
}

local default_lsp_config = {
  on_attach = on_attach,
  capabilities = capabilities,
  flags = {
    debounce_text_changes = 200,
    allow_incremental_sync = true,
  },
}

local server_names = {}
for server_name, _ in pairs(servers) do
  table.insert(server_names, server_name)
end
--[[ setupped by typescript package so we need to ensure installed by mason ]]
table.insert(server_names, "tsserver")

local present_mason, mason = pcall(require, "mason-lspconfig")
if present_mason then
  mason.setup({ ensure_installed = server_names })
end

local present_typescript, typescript = pcall(require, "typescript")

if present_typescript then
  typescript.setup({
    server = {
      on_attach = function(client, bufnr)
        on_attach(client, bufnr)
        remaps.set_typescript(bufnr)
      end,
    },
  })
end

for server_name, server_config in pairs(servers) do
  local merged_config = vim.tbl_deep_extend("force", default_lsp_config, server_config)

  lspconfig[server_name].setup(merged_config)

  if server_name == "rust_analyzer" then
    local present_rust_tools, rust_tools = pcall(require, "rust-tools")

    if present_rust_tools then
      rust_tools.setup({ server = merged_config })
    end
  end
end

ufo.setupWithFallback()
