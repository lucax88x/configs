return {
  "folke/todo-comments.nvim",
  config = function()
    local todo_comments = require("todo-comments")
    todo_comments.setup()
  end,
  event = "VeryLazy",
}
