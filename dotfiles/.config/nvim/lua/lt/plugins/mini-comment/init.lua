return {
  "echasnovski/mini.comment",
  event = { "BufReadPost", "BufNewFile" },
  dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
  opts = {
    hooks = {
      pre = function()
        require("ts_context_commentstring.internal").update_commentstring({})
      end,
    },
  },
  config = function(_, opts)
    require("mini.comment").setup(opts)
  end,
}
