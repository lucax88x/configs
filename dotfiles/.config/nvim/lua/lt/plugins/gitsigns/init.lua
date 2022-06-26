local present, gitsigns = pcall(require, "gitsigns")

if not present then
  return
end

gitsigns.setup({
  signs = {
    add = { hl = "GruvboxGreen", text = "│", numhl = "GitSignsAddNr" },
    change = { hl = "GruvboxAqua", text = "│", numhl = "GitSignsChangeNr" },
    delete = { hl = "GruvboxRed", text = "_", numhl = "GitSignsDeleteNr" },
    topdelete = { hl = "GruvboxRed", text = "‾", numhl = "GitSignsDeleteNr" },
    changedelete = { hl = "GruvboxAqua", text = "~", numhl = "GitSignsChangeNr" },
  },
  numhl = false,
  watch_gitdir = {
    interval = 1000,
  },
  sign_priority = 9,
  status_formatter = nil, -- Use default
})

local r = require("lt.utils.remaps")

r.which_key("<leader>gh", "hunks")

r.noremap("n", "]h", "&diff ? ']h' : '<cmd>lua require\"gitsigns\".next_hunk()<CR>'", "Go to next hunk")
r.noremap("n", "[h", "&diff ? '[h' : '<cmd>lua require\"gitsigns\".prev_hunk()<CR>'", "Go to prev hunk")

r.noremap("n", "<leader>ghs", '<cmd>lua require"gitsigns".stage_hunk()<CR>', "Stage hunk")

r.noremap("n", "<leader>ghu", '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>', "Undo stage hunk")

r.noremap("n", "<leader>ghr", '<cmd>lua require"gitsigns".reset_hunk()<CR>', "Reset hunk")
r.noremap("n", "<leader>ghp", '<cmd>lua require"gitsigns".preview_hunk()<CR>', "Preview hunk")
r.noremap("n", "<leader>ghb", '<cmd>lua require"gitsigns".blame_line()<CR>', "Blame line")
