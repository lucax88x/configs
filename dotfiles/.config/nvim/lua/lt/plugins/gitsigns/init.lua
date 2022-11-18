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

r.noremap("n", "]h", function()
  if vim.wo.diff then
    return "]h"
  end
  vim.schedule(function()
    gitsigns.next_hunk()
  end)
  return "<Ignore>"
end, "go to next hunk", { expr = true })

r.noremap("n", "[h", function()
  if vim.wo.diff then
    return "[h"
  end
  vim.schedule(function()
    gitsigns.prev_hunk()
  end)
  return "<Ignore>"
end, "go to prev hunk", { expr = true })

r.noremap("n", "<leader>ghs", gitsigns.stage_hunk, "Stage hunk")
r.noremap("n", "<leader>ghu", gitsigns.undo_stage_hunk, "Undo stage hunk")
r.noremap("n", "<leader>ghr", gitsigns.reset_hunk, "Reset hunk")
r.noremap("n", "<leader>ghp", gitsigns.preview_hunk, "Preview hunk")
r.noremap("n", "<leader>ghb", gitsigns.blame_line, "Blame line")
r.noremap("n", "<leader>ghd", gitsigns.diffthis, "Diff this")
