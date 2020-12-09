local lsp = require('lspconfig')
local lsp_status = require('lsp-status')
local completion = require('completion')

local function on_attach(client)
    lsp_status.on_attach(client)
    completion.on_attach(client)

    require('lsp.remaps')

    print('Attached to ' .. client.name)
end

local default_lsp_config = {on_attach = on_attach, capabilities = lsp_status.capabilities}

-- :LspInstall needed
local servers = {"bashls", "vimls", "dockerls", "diagnosticls", "tsserver", "cssls", "html", "jsonls", "rust_analyzer"}
for _, server in ipairs(servers) do lsp[server].setup(default_lsp_config) end

-- Lua LSP
lsp.sumneko_lua.setup {
    on_attach = on_attach,
    capabilities = lsp_status.capabilities,
    cmd = { 'luals' },
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

local eslint = require('lsp.linters.eslint')
local prettier = require('lsp.formatters.prettier')
local prettier_standard = require('lsp.formatters.prettier_standard')

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
