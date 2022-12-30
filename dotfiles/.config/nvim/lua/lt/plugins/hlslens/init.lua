return {
  "kevinhwang91/nvim-hlslens",
  config = function()
    local hlslens = require("hlslens")
    local present_scrollbar = pcall(require, "scrollbar")

    hlslens.setup()

    if present_scrollbar then
      require("scrollbar.handlers.search").setup()
    end

    local r = require("lt.utils.remaps")

    r.noremap(
      { "n", "v", "o" },
      "n",
      "<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>",
      "Next search by n",
      { silent = true }
    )
    r.noremap(
      { "n", "v", "o" },
      "N",
      "<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>",
      "Previous search br N",
      { silent = true }
    )
    r.noremap(
      { "n", "v", "o" },
      "*",
      "*<Cmd>lua require('hlslens').start()<CR>",
      "Next search (by *)",
      { silent = true }
    )
    r.noremap(
      { "n", "v", "o" },
      "#",
      "#<Cmd>lua require('hlslens').start()<CR>",
      "Previous search (by #)",
      { silent = true }
    )

    r.noremap(
      { "n", "v", "o" },
      "g*",
      "g*<Cmd>lua require('hlslens').start()<CR>",
      "Next search (by *)",
      { silent = true }
    )

    r.noremap(
      { "n", "v", "o" },
      "g#",
      "g#<Cmd>lua require('hlslens').start()<CR>",
      "Previous search (by #)",
      { silent = true }
    )
  end,
}
