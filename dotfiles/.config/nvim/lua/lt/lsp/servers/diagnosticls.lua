local eslint = require('lt.lsp.servers.linters.eslint')
local prettier = require('lt.lsp.servers.formatters.prettier')

local M = {}

M.options = {
    cmd = { "diagnostic-languageserver", "--stdio" },
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
            prettier = prettier
        }
    }
}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = {
      spacing = 0,
      prefix = "■",
    },

    -- see: ":help vim.lsp.diagnostic.set_signs()"
    signs = true,

    update_in_insert = false,
  }
)

return M
