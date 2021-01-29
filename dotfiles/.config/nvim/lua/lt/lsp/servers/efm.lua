local lsp = require('lspconfig')

-- local luafmt = require "lt.lsp.servers.efm.formatters.luafmt"
local prettier = require "lt.lsp.servers.formatters.prettier"
local eslint_d = require "lt.lsp.servers.linters.eslint_d"

local languages = {
  --lua = {luafmt},
  typescript = {prettier, eslint_d},
  javascript = {prettier, eslint_d},
  typescriptreact = {prettier, eslint_d},
  ['typescript.tsx'] = {prettier, eslint_d},
  javascriptreact = {prettier, eslint_d},
  ['javascript.jsx'] = {prettier, eslint_d},
  yaml = {prettier},
  json = {prettier},
  html = {prettier},
  scss = {prettier},
  css = {prettier},
  markdown = {prettier},
}

return function(language_server_path)
    local bin_path = language_server_path .. "/efm-langserver/efm-langserver"
    return {
         -- cmd = {
         --   bin_path,
         --  "-loglevel",
         --  "10"
        -- },
        cmd = {
          bin_path,
        },
        root_dir = lsp.util.root_pattern("package.json", ".git", vim.fn.getcwd()),
        filetypes = vim.tbl_keys(languages),
        init_options = {
          documentFormatting = true,
          codeAction = true
        },
        settings = {
          rootMarkers = { "package.json", ".git" },
          languages = languages
        },
    }
end
