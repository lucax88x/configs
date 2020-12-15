local eslint = require('lt.lsp.linters.eslint')
local prettier = require('lt.lsp.formatters.prettier')
local prettier_standard = require('lt.lsp.formatters.prettier_standard')

local M = {}

M.options = {
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
    virtual_text = {
      spacing = 0,
      prefix = "~"
    },

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

return M
