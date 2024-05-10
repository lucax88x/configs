return {
  "nvimtools/none-ls.nvim",
  event = { "BufReadPre", "BufNewFile", "BufEnter" },
  dependencies = { "mason.nvim" },
  config = function()
    local nls = require("null-ls")
    local diagnostics = nls.builtins.diagnostics
    local code_actions = nls.builtins.code_actions

    -- done by mason now
    -- npm install -g @fsouza/prettierd  stylelint
    -- paru -S selene-linter shfmt yamllint actionlint-bin stylua

    -- paru -S nginxbeautifier ansible-lint-git
    -- brew install ansible-lint gitlint stylelint
    -- brew install tfsec

    nls.setup({
      debug = false,
      sources = {
        -- github actions
        -- diagnostics.actionlint,
        diagnostics.selene,

        diagnostics.zsh,
        diagnostics.stylelint,
        diagnostics.yamllint,
        diagnostics.ansiblelint,
        -- diagnostics.golangci_lint,
        diagnostics.gitlint,
        diagnostics.tfsec,

        -- code_actions.gitsigns,
        code_actions.refactoring,
      },
    })
  end,
}
