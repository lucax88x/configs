return {
  "jose-elias-alvarez/null-ls.nvim",
  event = { "BufReadPre", "BufNewFile", "BufEnter" },
  dependencies = { "mason.nvim" },
  config = function()
    local nls = require("null-ls")
    local formatting = nls.builtins.formatting
    local diagnostics = nls.builtins.diagnostics
    local code_actions = nls.builtins.code_actions

    -- done by mason now
    -- npm install -g @fsouza/prettierd  stylelint
    -- paru -S selene-linter shfmt shellcheck-bin yamllint actionlint-bin stylua

    -- paru -S nginxbeautifier ansible-lint-git
    -- brew install ansible-lint gitlint stylelint
    -- brew install tfsec


    nls.setup({
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
        -- formatting.prettierd.with({
        --   condition = function(utils)
        --     return utils.has_file({ ".prettierrc*" })
        --   end,
        -- }),
        formatting.prettierd,
        formatting.stylelint,
        -- formatting.nginx_beautifier,
        formatting.shfmt,
        formatting.xmllint,
        formatting.terraform_fmt,
        formatting.yamlfmt,
        formatting.jq,
        formatting.clang_format,

        -- code_actions.gitsigns,
        code_actions.refactoring,
        code_actions.shellcheck,
      },
    })
  end,
}
