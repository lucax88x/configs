return {
  "stevearc/conform.nvim",
  opts = {},
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        lua = { "stylua" },
        javascript = { { "prettierd", "prettier" } },
        typescript = { { "prettierd", "prettier" } },
        javascriptreact = { { "prettierd", "prettier" } },
        typescriptreact = { { "prettierd", "prettier" } },
        vue = { { "prettierd", "prettier" } },
        css = { { "prettierd", "prettier" } },
        go = { "goimports", "gofmt" },
        bash = { "shfmt" },
        yaml = { "yamlfmt" },
        xml = { "xmlformatter" },
        json = { "jq" },
        python = { "isort", "ruff_format" },
        -- python = function(bufnr)
        --   -- if require("conform").get_formatter_info("ruff_format", bufnr).available then
        --   return { "ruff_format" }
        --   -- else
        --   --   return { "isort", "black" }
        --   -- end
        -- end,
      },
    })
  end,
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
