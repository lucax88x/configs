
-- Visualize diagnostics
vim.g.diagnostic_enable_virtual_text = 1
vim.g.diagnostic_trimmed_virtual_text = '40'
-- Don't show diagnostics while in insert mode
vim.g.diagnostic_insert_delay = 1

-- nvim_lsp object
local lsp = require'lspconfig'
local lsp_status = require'lsp-status'
local completion = require'completion'

-- function to attach completion and diagnostics
-- when setting up lsp
local on_attach = function(client)
    completion.on_attach(client)

    lsp_status.register_client(client.name)
    lsp_status.on_attach(client)

    print("'" .. client.name .. "' language server attached");
end

local default_lsp_config = {on_attach = on_attach, capabilities = lsp_status.capabilities}

-- :LspInstall needed
local servers = {"bashls", "vimls", "dockerls", "diagnosticls", "tsserver", "cssls", "html", "jsonls", "rust_analyzer"}
for _, server in ipairs(servers) do lsp[server].setup(default_lsp_config) end

lsp.diagnosticls.setup({
  on_attach = on_attach,
  filetypes={
    'markdown',
    'javascript',
    'typescript',
    'javascriptreact',
    'typescriptreact',
    'typescript.tsx',
    'css',
    'scss',
    'sass'
  },
  init_options = {
    linters = {
      eslint = {
        command = './node_modules/.bin/eslint',
        rootPatterns = { '.git' },
        debounce = 100,
        args = {
          '--stdin',
          '--stdin-filename',
          '%filepath',
          '--format',
          'json'
        },
        sourceName = 'eslint',
        parseJson = {
          errorsRoot = '[0].messages',
          line = 'line',
          column = 'column',
          endLine = 'endLine',
          endColumn = 'endColumn',
          message = '${message} [${ruleId}]',
          security = 'severity'
        },
        securities = {
          [2] = 'error',
          [1] = 'warning',
        },
      },
      stylelint = {
        command = './node_modules/.bin/stylelint',
        rootPatterns = { '.git' },
        debounce = 100,
        args = {
          '--formatter',
          'json',
          '--stdin-filename',
          '%filepath'
        },
        sourceName = 'stylelint',
        parseJson = {
          errorsRoot = '[0].warnings',
          line = 'line',
          column = 'column',
          message = '${text}',
          security = 'severity'
        },
        securities = {
          error = 'error',
          warning = 'warning'
        }
      },
      markdownlint = {
        command = 'markdownlint',
        isStderr = true,
        debounce = 100,
        args = { '--stdin' },
        offsetLine = 0,
        offsetColumn = 0,
        sourceName = 'markdownlint',
        formatLines = 1,
        formatPattern = {
          '^.*?:\\s+(\\d+):\\s+(.*)(\\r|\\n)*$',
          {
            line = 1,
            column = -1,
            message = 2
          }
        }
      }
    },
    filetypes = {
      markdown = 'markdownlint',
      javascript = 'eslint',
      typescript = 'eslint',
      javascriptreact = 'eslint',
      typescriptreact = 'eslint',
      ["typescript.tsx"] = "eslint",
      css = 'stylelint',
      scss = 'stylelint',
      sass = 'stylelint'
    },
    formatters = {
      prettier = {
        command = './node_modules/.bin/prettier',
        args = {
          '--stdin-filepath',
          '%filepath',
          '--single-quote',
          '--print-width 120'
        }
      }
    },
    formatFiletypes = {
      javascript = 'prettier',
      typescript = 'prettier',
      javascriptreact = 'prettier',
      typescriptreact = 'prettier'
    },
  }
})

vim.fn.sign_define("LspDiagnosticsErrorSign",
    {text = "!", texthl = "LspDiagnosticsError"})
vim.fn.sign_define("LspDiagnosticsWarningSign",
    {text = "?", texthl = "LspDiagnosticsWarning"})
vim.fn.sign_define("LspDiagnosticsInformationSign",
    {text = "?", texthl = "LspDiagnosticsInformation"})
vim.fn.sign_define("LspDiagnosticsHintSign",
    {text = ".", texthl = "LspDiagnosticsHint"})
