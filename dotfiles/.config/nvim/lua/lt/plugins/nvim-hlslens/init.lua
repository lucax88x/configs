local present, hlslens = pcall(require, "hlslens")
local present_scrollbar, scrollbar = pcall(require, "scrollbar")

if not present then
  return
end

hlslens.setup({
  build_position_cb = function(plist)
    if present_scrollbar then
      scrollbar.search_handler.show(plist.start_pos)
    end
  end,
})

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
r.noremap({ "n", "v", "o" }, "*", "*<Cmd>lua require('hlslens').start()<CR>", "Next search (by *)", { silent = true })
r.noremap(
  { "n", "v", "o" },
  "#",
  "#<Cmd>lua require('hlslens').start()<CR>",
  "Previous search (by #)",
  { silent = true }
)

r.noremap({ "n", "v", "o" }, "g*", "g*<Cmd>lua require('hlslens').start()<CR>", "Next search (by *)", { silent = true })

r.noremap(
  { "n", "v", "o" },
  "g#",
  "g#<Cmd>lua require('hlslens').start()<CR>",
  "Previous search (by #)",
  { silent = true }
)
