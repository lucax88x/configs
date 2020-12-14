local lsp = require('lspconfig')
local lsp_completion = require('completion')
local lsp_status  = require('lsp-status')

local function on_attach(client)
    lsp_status.on_attach(client)
    lsp_completion.on_attach(client)
end

lsp_status.register_progress()

local default_lsp_config = {on_attach = on_attach, capabilities = lsp_status.capabilities}

-- :LspInstall needed
local servers = {
  "bashls",
  "vimls",
  "dockerls",
  "yamlls",

  "diagnosticls",

  "rust_analyzer",
  "tsserver",
  "cssls",
  "html",
  "jsonls",
}

for _, server in ipairs(servers) do lsp[server].setup(default_lsp_config) end

-- Lua LSP
lsp.sumneko_lua.setup {
    on_attach = on_attach,
    capabilities = lsp_status.capabilities,
    -- :LspInstallInfo sumneko_lua
    cmd = { '/home/lucatrazzi/.cache/nvim/lspconfig/sumneko_lua/lua-language-server/bin/Linux/lua-language-server' },
    settings = {
        Lua = {
            diagnostics = {
                globals = {
                    'vim',
                    'use',
                    'imap',
                    'nmap',
                    'vmap',
                    'tmap',
                    'inoremap',
                    'nnoremap',
                    'vnoremap',
                    'tnoremap'
                }
            },
            workspace = {
                library = {
                    ['$VIMRUNTIME/lua'] = true,
                }
            }
        }
    }
}

local eslint = require('lt.lsp.linters.eslint')
local prettier = require('lt.lsp.formatters.prettier')
local prettier_standard = require('lt.lsp.formatters.prettier_standard')

lsp.diagnosticls.setup {
    on_attach = on_attach,
    capabilities = lsp_status.capabilities,
    filetypes = {
        'javascript',
        'javascriptreact',
        'javascript.jsx',
        'typescript',
        'typescriptreact',
        'typescript.tsx'
    },
    init_options = {
        filetypes = {
            javascript = 'eslint',
            javascriptreact = 'eslint',
            ["javascript.jsx"] = 'eslint',
            typescript = 'eslint',
            typescriptreact = 'eslint',
            ["typescript.tsx"] = 'eslint'
        },
        formatFiletypes = {
            javascript = 'prettier',
            javascriptreact = 'prettier',
            ["javascript.jsx"] = 'prettier',
            typescript = 'prettier',
            typescriptreact = 'prettier',
            ["typescript.tsx"] = 'prettier'
        },
        linters = {
            eslint = eslint
        },
        formatters = {
            prettier_standard = prettier_standard,
            prettier = prettier
        }
    }
}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    -- This will disable virtual text, like doing:
    -- let g:diagnostic_enable_virtual_text = 0
    virtual_text = true,

    -- This is similar to:
    -- let g:diagnostic_show_sign = 1
    -- To configure sign display,
    --  see: ":help vim.lsp.diagnostic.set_signs()"
    signs = true,

    -- This is similar to:
    -- "let g:diagnostic_insert_delay = 1"
    update_in_insert = false,
  }
)

