return {
  "echasnovski/mini.bracketed",
  version = false,
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    require("mini.bracketed").setup({
      diagnostic = { suffix = "e", options = {} },
      quickfix = { suffix = "" },
      comment = { suffix = "" },
    })
  end,
}
