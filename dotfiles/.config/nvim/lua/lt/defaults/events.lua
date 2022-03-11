
local group = vim.api.nvim_create_augroup("HighlightOnYank", { clear = true });

vim.api.nvim_create_autocmd("TextYankPost", {
  group = group,
  desc = "Highlight the text that was yanked",
  callback = function ()
    vim.highlight.on_yank({ timeout = 500 })
  end
})
