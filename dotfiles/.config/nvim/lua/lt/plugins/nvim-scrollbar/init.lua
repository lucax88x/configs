local present, scrollbar = pcall(require, "scrollbar")

if not present then
  return
end

scrollbar.setup({})
