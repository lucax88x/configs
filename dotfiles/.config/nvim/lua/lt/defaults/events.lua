local vim = vim

local highlight_on_yank_group = vim.api.nvim_create_augroup("HighlightOnYank", { clear = true })

vim.api.nvim_create_autocmd("TextYankPost", {
  group = highlight_on_yank_group,
  desc = "Highlight the text that was yanked",
  callback = function()
    vim.highlight.on_yank({ timeout = 500 })
  end,
})

local set_ansible_filetype_group = vim.api.nvim_create_augroup("SetAnsibleFileType", { clear = true })

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  group = set_ansible_filetype_group,
  pattern = { "*/playbooks/*.yml" },
  desc = "Set yaml.ansible when playbook file is opened",
  callback = function()
    vim.bo.filetype = "yaml.ansible"
  end,
})

local set_mts_filetype_group = vim.api.nvim_create_augroup("SetMtsFileType", { clear = true })

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  group = set_mts_filetype_group,
  pattern = { "*.mts" },
  desc = "Set mts to typescript",
  callback = function()
    vim.bo.filetype = "typescript"
  end,
})
--
-- vim.api.nvim_create_autocmd("BufEnter", {
--   callback = function(ctx)
--     local root = vim.fs.root(ctx.buf, { ".git", "Makefile" })
--     if root then
--       vim.notify("root found, could change to " .. root)
--       -- vim.uv.chdir(root)
--     end
--   end,
-- })
