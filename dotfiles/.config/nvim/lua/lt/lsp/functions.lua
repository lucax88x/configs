local M = {}

M.show_diagnostics = function(opts)
	opts = opts or {}
	vim.lsp.diagnostic.set_loclist({ open_loclist = false })
	require("telescope.builtin").loclist(opts)
end

-- https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md
M.lsp_install_servers = function()
    local function installLanguageServer(languageServer)
      vim.cmd ('LspInstall ' .. languageServer)
    end

    installLanguageServer('tsserver')
    installLanguageServer('vuels')
    installLanguageServer('sumneko_lua')
    installLanguageServer('bashls')
    installLanguageServer('jsonls')
    installLanguageServer('yamlls')
    installLanguageServer('html')
    installLanguageServer('cssls')
    installLanguageServer('csharp_ls')
    installLanguageServer('dockerls')
    installLanguageServer('graphql')
    installLanguageServer('efm')
    installLanguageServer('rust_analyzer')
    installLanguageServer('eslint')
end

return M
