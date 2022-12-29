local present, notify = pcall(require, "notify")

if not present then
  return
end

notify.setup({
  stages = "fade",
  render = "minimal",
})

vim.notify = notify
