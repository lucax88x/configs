local present, gitsigns = pcall(require, "gitsigns")

if not present then
  return
end

gitsigns.setup({
  numhl = false,
  watch_gitdir = {
    interval = 1000,
  },
  sign_priority = 9,
  status_formatter = nil, -- Use default
})

local present_scrollbar = pcall(require, "scrollbar")

if present_scrollbar then
  require("scrollbar.handlers.gitsigns").setup()
end

local r = require("lt.utils.remaps")

r.which_key("<leader>gh", "hunks")

r.noremap("n", "]h", "&diff ? ']h' : '<cmd>lua require\"gitsigns\".next_hunk()<CR>'", "Go to next hunk")
r.noremap("n", "[h", "&diff ? '[h' : '<cmd>lua require\"gitsigns\".prev_hunk()<CR>'", "Go to prev hunk")

r.noremap("n", "<leader>ghs", '<cmd>lua require"gitsigns".stage_hunk()<CR>', "Stage hunk")

r.noremap("n", "<leader>ghu", '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>', "Undo stage hunk")

r.noremap("n", "<leader>ghr", '<cmd>lua require"gitsigns".reset_hunk()<CR>', "Reset hunk")
r.noremap("n", "<leader>ghp", '<cmd>lua require"gitsigns".preview_hunk()<CR>', "Preview hunk")
r.noremap("n", "<leader>ghb", '<cmd>lua require"gitsigns".blame_line()<CR>', "Blame line")
