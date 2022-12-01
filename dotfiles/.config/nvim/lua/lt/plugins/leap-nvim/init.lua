local present, leap = pcall(require, "leap")

if not present then
  vim.notify("leap not present")
  return
end

local present_flit, flit = pcall(require, "flit")

leap.add_default_mappings()

if not present_flit then
  vim.notify("flit not present")
  return
end

flit.setup()
