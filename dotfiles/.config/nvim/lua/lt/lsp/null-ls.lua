local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
    return
end

-- npm install -g @fsouza/prettierd
-- npm install -g stylelint
-- paru -S selene-linter
-- paru -S shfmt-bin
-- paru -S shellcheck-bin
-- paru -S yamllint


local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

null_ls.setup({
 debug = false,
 sources = {
   diagnostics.actionlint,
   diagnostics.selene,
   diagnostics.shellcheck,
   diagnostics.zsh,
   diagnostics.stylelint,
   diagnostics.yamllint,

   formatting.prettierd,
   formatting.stylelint,
   formatting.nginx_beautifier,
   formatting.shfmt,
   formatting.sqlformat,
   formatting.xmllint,

   code_actions.gitsigns,
   code_actions.refactoring,
   code_actions.shellcheck
 },
})
