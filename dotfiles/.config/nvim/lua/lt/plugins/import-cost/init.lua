return {
  "barrett-ruth/import-cost.nvim",
  build = "sh install.sh pnpm",
  ft = { "typescript", "javascript", "typescriptreact", "javascriptreact" },
  config = function()
    require("import-cost").setup({})
  end,
}
