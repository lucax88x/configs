return {
  "folke/which-key.nvim",
  keys = { "<leader>" },
  config = function()
    local which_key = require("which-key")

    local opts = {
      prefix = "<leader>",
    }

    which_key.setup()

    local groups = {
      b = { name = "buffer" },
      s = { name = "search" },
      p = { name = "project" },
      ["pc"] = { name = "compile" },
      w = { name = "window" },
      g = { name = "git" },
      gd = { name = "diffview" },
      h = { name = "hunks" },
      t = { name = "types" },
      r = { name = "refactor" },
      l = { name = "lsp" },
      d = { name = "debug" },
      z = { name = "zen" },
      v = { name = "view/render" },
      n = { name = "notes" },
      q = { name = "quick switcher" },
      k = { name = "terminal" },
      c = { name = "chatgpt" },
      C = { name = "compile" },
      [";"] = { name = "test" },
      ["'"] = { name = "marks" },
      ['"'] = { name = "registers" },
      ["/"] = { name = "search" },
      ["/g"] = { name = "git" },
      ["/gd"] = { name = "diff" },
      ["["] = { name = "previous" },
      ["]"] = { name = "next" },
    }

    which_key.register(groups, opts)
  end,
}
