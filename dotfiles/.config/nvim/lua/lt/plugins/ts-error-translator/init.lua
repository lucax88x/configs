return {
  "dmmulroy/ts-error-translator.nvim",
  ft = { "ts", "mts", "tsx" },
  config = function()
    require("ts-error-translator").setup()
  end,
}
