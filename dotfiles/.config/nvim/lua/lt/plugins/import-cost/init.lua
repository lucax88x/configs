return {
  "barrett-ruth/import-cost.nvim",
  build = "sh install.sh npm",
  --[[ ft = { "typescript", "javascript", "typescriptreact", "javascriptreact" }, ]]
  config = function()
    require("import-cost").setup({})
  end,
}
