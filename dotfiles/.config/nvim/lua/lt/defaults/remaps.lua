local r = require("lt.utils.remaps")
local functions = require("lt.utils.functions")

-- quit
r.noremap("n", "Q", "<cmd>q<CR>", "Quits editor")
r.noremap("n", "<leader>Q", "<cmd>q!<CR>", "Force quits editor")

-- reload
r.noremap("n", "<leader><CR>", functions.reload, "Reloads configuration")

-- undo
r.noremap("n", "<leader>u", "<cmd>UndotreeToggle<CR>", "Toggle undo history")

-- move upper/down on visual
r.noremap("v", "K", '<cmd>m "<-2<CR>gv=gv"', "Move upper on visual")
r.noremap("v", "J", '<cmd>m ">+1<CR>gv=gv"', "Move down on visual")

-- deletes in visual
r.noremap("v", "X", '"_d', "Deletes on visual")

-- when going to next search, we center screen
r.noremap("n", "n", "nzzzv", "When going to next search, we center screen")
r.noremap("n", "N", "Nzzzv", "When going to previous search, we center screen")

-- buffers
-- bufremove
-- r.noremap("n", "<leader>bd", "<cmd>bd<CR>", "Deletes buffer")
-- r.noremap("n", "<leader>bD", "<cmd>bd!<CR>", "Force delete buffer")
r.noremap("n", "<leader>bA", "<cmd>%bd<CR>", "Deletes all buffers")
r.noremap("n", "<leader>bw", "<cmd>update<CR>", "Saves/writes/updates buffer")
r.noremap("n", "<leader>bW", "<cmd>update!<CR>", "Force save/write/update buffer")

vim.keymap.set("n", "<leader>ww", function()
  vim.opt.wrap = not vim.o.wrap
end, { desc = "Toggles window wrap" })

vim.keymap.set("n", "<leader>wc", function()
  local current_level = vim.o.conceallevel + 1

  if current_level > 3 then
    current_level = 0
  end

  vim.opt.conceallevel = current_level
end, { desc = "Toggles conceal level" })

-- maps c-n / c-t to navigate while searching with /
vim.api.nvim_exec(
  [[
cnoremap <expr> <c-n> getcmdtype() =~ '[\/?]' ? '<c-g>' : '<c-n>'
cnoremap <expr> <c-p> getcmdtype() =~ '[\/?]' ? '<c-t>' : '<c-p>'
]],
  false
)
