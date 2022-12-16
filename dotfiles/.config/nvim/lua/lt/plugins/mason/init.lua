local vim = vim
local present_mason, mason = pcall(require, "mason")
local present_mason_tool_installer, mason_tool_installer = pcall(require, "mason-tool-installer")

if not present_mason then
  vim.notify("Could not load mason")
  return
end

mason.setup()

if not present_mason_tool_installer then
  vim.notify("Could not load mason-tool-installer")
  return
end

mason_tool_installer.setup({
  ensure_installed = {
    "prettierd",
    "stylelint-lsp",
    "selene",
    "shfmt",
    "shellcheck",
    "yamllint",
    "actionlint",
    --[[ "nginxbeautifier", ]]
    "stylua",
    --[[ "ansible", ]]
    "luacheck",
    "golangci-lint",
    "gitlint",
    "jsonlint",
  },

  auto_update = false,
  run_on_start = false,
})
