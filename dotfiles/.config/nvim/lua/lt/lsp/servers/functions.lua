local M = {}

-- https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md
M.lsp_install_servers = function()
    local function installLanguageServer(filetype, languageServer)
        if pcall(function() vim.cmd ('set filetype=' .. filetype) end) then
          vim.cmd ('LspInstallServer ' .. languageServer)
        else
          vim.cmd ('LspInstallServer ' .. languageServer)
        end
    end

    installLanguageServer('typescript', 'typescript-language-server')
    installLanguageServer('vue', 'vls')
    installLanguageServer('lua', 'sumneko-lua-language-server')
    installLanguageServer('sh', 'bash-language-server')
    installLanguageServer('json', 'json-languageserver')
    installLanguageServer('yaml', 'yaml-language-server')
    installLanguageServer('html', 'html-languageserver')
    installLanguageServer('css', 'css-languageserver')
    installLanguageServer('cs', 'omnisharp-lsp')
    installLanguageServer('Dockerfile', 'docker-langserver')

    -- must be installed globally
    installLanguageServer('*', 'efm-langserver')
end

return M
