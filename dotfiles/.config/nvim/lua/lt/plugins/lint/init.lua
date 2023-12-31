return {
  "mfussenegger/nvim-lint",
  config = function()
    local lint = require("lint")
    lint.linters_by_ft = {
      lua = {
        "selene",
      },
      sh = {
        "shellcheck",
      },
      bash = {
        "shellcheck",
      },
      zsh = {
        "shellcheck",
      },
      css = {
        "stylelint",
      },
      scss = {
        "stylelint",
      },
      yaml = {
        "yamllint",
      },
      yml = {
        "yamllint",
      },
      json = {
        "jsonlint",
      },
      go = {
        "golangcilint",
      },
      Terraform = {
        "tfsec",
      },
      -- typescript = {
      --   "eslint_d",
      -- },
      -- javascriptreact = {
      --   "eslint_d",
      -- },
      -- typescriptreact = {
      --   "eslint_d",
      -- },
    }

    vim.api.nvim_create_autocmd({ "InsertLeave", "BufWritePost" }, {
      callback = function()
        lint.try_lint()
      end,
    })
  end,
}
