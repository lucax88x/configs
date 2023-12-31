return {
  'stevearc/conform.nvim',
  opts = {},
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        lua = { "stylua" },
        javascript = { { "prettierd", "prettier" } },
        typescript = { { "prettierd", "prettier" } },
        javascriptreact = { { "prettierd", "prettier" } },
        typescriptreact = { { "prettierd", "prettier" } },
        css = { { "prettierd", "prettier" } },
        bash = { "shfmt" },
        yaml = { "yamlfmt" },
        xml = { "xmlformatter" },
        json = { "jq" },
      },
    })
  end
}

-- formatting.prettierd,
-- formatting.stylelint,
-- -- formatting.nginx_beautifier,
-- formatting.shfmt,
-- formatting.xmllint,
-- formatting.terraform_fmt,
-- formatting.yamlfmt,
-- formatting.jq,
-- formatting.clang_format,
