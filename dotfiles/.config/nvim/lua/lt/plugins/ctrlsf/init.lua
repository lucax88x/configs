return {
  "dyng/ctrlsf.vim",
  init = function()
    local r = require("lt.utils.remaps")

    r.map("n", "<leader>ss", "<Plug>CtrlSFPrompt", "Search term in all files")
    r.noremap("n", "<leader>sS", ":CtrlSFToggle<CR>", "Toggle searched term in all files")
  end,
  config = function()
    vim.g.ctrlsf_auto_focus = {
      at = "start",
    }
    vim.g.ctrlsf_populate_qflist = 1
  end,
  event = "VeryLazy",
}
