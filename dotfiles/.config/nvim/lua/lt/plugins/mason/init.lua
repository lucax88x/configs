return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  config = function()
    local mason = require("mason")
    local mason_tool_installer = require("mason-tool-installer")

    mason.setup()

    mason_tool_installer.setup({
      ensure_installed = {
        "prettierd",
        "stylelint-lsp",
        "selene",
        "shfmt",
        "shellcheck",
        "yamllint",
        "actionlint",
        --[[ "nginxbeautifier", ]]
        "stylua",
        --[[ "ansible", ]]
        "luacheck",
        "golangci-lint",
        "gitlint",
        "jsonlint",
      },

      auto_update = false,
      run_on_start = false,
    })
  end,
  dependencies = { "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim" },
}
