return {
  "smjonas/inc-rename.nvim",
  config = function()
    require("inc_rename").setup()
  end,
  keys = {
    { "<leader>rR", function() return ":IncRename " .. vim.fn.expand("<cword>") end, desc = "Rename", expr = true },
  }
}
