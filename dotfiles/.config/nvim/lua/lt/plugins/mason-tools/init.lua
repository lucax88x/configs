return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  config = function()
    require("mason-tool-installer").setup({
      ensure_installed = {
        -- lint
        "shellcheck",
        "selene",
        "stylelint",
        "yamllint",
        "jsonlint",
        "golangci-lint",

        -- format
        "stylua",
        "jq",
        "shfmt",
        "prettierd",
        "shfmt",
        "xmlformatter",
        "powershell-editor-services",
      },
    })
  end,
  dependencies = { "williamboman/mason.nvim" },
  cmd = { "Mason", "MasonInstall" },
}
