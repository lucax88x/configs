return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp-signature-help",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "petertriho/cmp-git",
    "saadparwaiz1/cmp_luasnip",
    "hrsh7th/cmp-nvim-lua",
    "windwp/nvim-autopairs",
    "onsails/lspkind-nvim",
    "roobert/tailwindcss-colorizer-cmp.nvim",
  },
  config = function()
    local cmp = require("cmp")
    local lsp_kind = require("lspkind")

    lsp_kind.init()

    local formatting_style = {
      fields = { "kind", "abbr", "menu" },
      format = function(entry, item)
        local icon = lsp_kind.presets.default[item.kind]
        icon = " " .. icon .. " "

        local lspkind_text = ({
          -- copilot = "[cop]",
          nvim_lsp = "[LSP]",
          luasnip = "[snp]",
          buffer = "[buf]",
          nvim_lua = "[lua]",
          path = "[path]",
        })[entry.source.name]

        item.menu = lspkind_text and "   (" .. item.kind .. ")" or ""
        item.kind = icon

        return require("tailwindcss-colorizer-cmp").formatter(entry, item)
      end,
    }

    local function too_big(bufnr)
      local max_filesize = 10 * 1024 -- 100 KB
      local check_stats = (vim.uv or vim.loop).fs_stat
      local ok, stats = pcall(check_stats, vim.api.nvim_buf_get_name(bufnr))
      if ok and stats and stats.size > max_filesize then
        return true
      else
        return false
      end
    end

    local preferred_sources = {
      { name = "nvim_lsp_signature_help", group_index = 1 },
      { name = "nvim_lsp", max_item_count = 20, group_index = 1 },
      { name = "luasnip", max_item_count = 5, group_index = 1 },
      { name = "nvim_lua", group_index = 1 },
      { name = "path", group_index = 2 },
    }

    vim.api.nvim_create_autocmd("BufRead", {
      group = vim.api.nvim_create_augroup("CmpBufferDisableGrp", { clear = true }),
      callback = function(ev)
        local sources = preferred_sources
        if not too_big(ev.buf) then
          sources[#sources + 1] = { name = "buffer", keyword_length = 4 }
        end
        cmp.setup.buffer({
          sources = cmp.config.sources(sources),
        })
      end,
    })

    cmp.setup({
      performance = {
        max_view_entries = 7,
      },
      view = {
        entries = { name = "custom", selection_order = "near_cursor" },
      },
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
      mapping = {
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.close(),
        ["<CR>"] = cmp.mapping.confirm({
          -- behavior = cmp.ConfirmBehavior.Replace,
          behavior = cmp.ConfirmBehavior.Insert,
          select = true,
        }),
        ["<C-n>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif require("luasnip").expand_or_jumpable() then
            vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
          else
            fallback()
          end
        end, {
          "i",
          "s",
        }),
        ["<C-p>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif require("luasnip").jumpable(-1) then
            vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
          else
            fallback()
          end
        end, {
          "i",
          "s",
        }),
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      formatting = formatting_style,

      sources = cmp.config.sources(vim.tbl_extend("force", preferred_sources, {
        { name = "buffer", keyword_length = 4 },
      })),
    })

    cmp.setup.filetype("gitcommit", {
      sources = cmp.config.sources({
        { name = "git" }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
      }, {
        { name = "buffer" },
      }),
    })

    cmp.setup.cmdline("/", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = "buffer" },
      },
    })

    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = "path" },
      }, {
        {
          name = "cmdline",
          option = {
            ignore_cmds = { "Man", "!" },
          },
        },
      }),
    })

    local presentAutopairs, cmp_autopairs = pcall(require, "nvim-autopairs.completion.cmp")
    if not presentAutopairs then
      return
    end

    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))
  end,
}
