local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end

-- done by mason now
-- npm install -g @fsouza/prettierd  stylelint
-- paru -S selene-linter shfmt shellcheck-bin yamllint actionlint-bin stylua

-- paru -S nginxbeautifier ansible-lint-git
-- brew install ansible-lint gitlint stylelint
-- brew install tfsec

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

null_ls.setup({
  debug = false,
  sources = {
    -- github actions
    -- diagnostics.actionlint,
    diagnostics.selene,

    diagnostics.shellcheck,
    diagnostics.zsh,
    diagnostics.stylelint,
    diagnostics.yamllint,
    diagnostics.ansiblelint,
    diagnostics.golangci_lint,
    diagnostics.gitlint,
    diagnostics.jsonlint,
    diagnostics.tfsec,

    formatting.stylua,
    formatting.prettierd,
    formatting.stylelint,
    formatting.nginx_beautifier,
    formatting.shfmt,
    formatting.xmllint,
    formatting.terraform_fmt,


    -- code_actions.gitsigns,
    code_actions.refactoring,
    code_actions.shellcheck,
  },
})
