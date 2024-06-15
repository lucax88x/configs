return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "nvim-lua/lsp-status.nvim",
    "pmizio/typescript-tools.nvim",
    "b0o/schemastore.nvim",
    "williamboman/mason-lspconfig.nvim",
    "SmiteshP/nvim-navic",
    require("lt.plugins.lsp_lines"),
    require("lt.plugins.aerial"),
  },
  event = { "BufReadPre", "BufNewFile", "BufEnter" },
  config = function()
    local lspconfig = require("lspconfig")

    local remaps = require("lt.plugins.lsp.remaps")
    local icons = require("lt.utils.icons")

    local presentLspStatus, lsp_status = pcall(require, "lsp-status")
    local presentCmpNvimLsp, cmp_lsp = pcall(require, "cmp_nvim_lsp")
    local presentLspSignature, lsp_signature = pcall(require, "lsp_signature")
    local presentNavic, navic = pcall(require, "nvim-navic")
    local presentUfo = pcall(require, "ufo")
    local ufo = require("lt.plugins.ufo.setup")

    vim.lsp.set_log_level("error") -- 'trace', 'debug', 'info', 'warn', 'error'

    local function try_attach_navic(client, bufnr)
      if not presentNavic then
        vim.notify("navic not present")
      else
        local filetype = vim.api.nvim_buf_get_option(bufnr or 0, "filetype")

        if client.server_capabilities.documentSymbolProvider then
          if client.name == "graphql" then
            if filetype == "typescript" or filetype == "typescriptreact" or filetype == "javascript" then
              return
            end
          end

          if client.name == "eslint" or client.name == "angularls" or client.name == "null-ls" then
            return
          end

          -- vim.notify("attach navic to " .. client.name)
          navic.attach(client, bufnr)
        end
      end
    end

    local function try_attach_inlay_hints(client, bufnr)
      if client.server_capabilities.inlayHintProvider then
        vim.api.nvim_create_augroup("lsp_augroup", { clear = true })

        vim.api.nvim_create_autocmd("InsertEnter", {
          buffer = bufnr,
          callback = function()
            vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
          end,
          group = "lsp_augroup",
        })
        vim.api.nvim_create_autocmd("InsertLeave", {
          buffer = bufnr,
          callback = function()
            vim.lsp.inlay_hint.enable(false, { bufnr = bufnr })
        
          end,
          group = "lsp_augroup",
        })
      end
    end

    local function on_attach(client, bufnr)
      -- print(client.name)
      -- require("lt.utils.functions").tprint_keys(client.server_capabilities)

      remaps.set_default_on_buffer(client, bufnr)

      if presentLspStatus then
        lsp_status.on_attach(client)
      end

      if presentLspSignature then
        lsp_signature.on_attach({ floating_window = false, timer_interval = 500 })
      end

      try_attach_navic(client, bufnr)
      try_attach_inlay_hints(client, bufnr)

      if client.name == "tsserver" then
        -- let prettier format
        client.server_capabilities.document_formatting = false
        client.server_capabilities.documentFormattingProvider = false
      end
    end

    local config = {
      -- show signs
      update_in_insert = true,
      underline = true,
      float = {
        focus = false,
        focusable = true,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
      },
      virtual_text = {
        spacing = 4,
        source = "if_many",
        prefix = "●",
      },
      -- enables lsp_lines but we want to start disabled
      virtual_lines = false,
      severity_sort = true,
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = icons.diagnostics.Error,
          [vim.diagnostic.severity.WARN] = icons.diagnostics.Warn,
          [vim.diagnostic.severity.HINT] = icons.diagnostics.Hint,
          [vim.diagnostic.severity.INFO] = icons.diagnostics.Info,
        },
      },
      inlay_hints = {
        enabled = true,
        exclude = {}, -- filetypes for which you don't want to enable inlay hints
      },
      codelens = {
        enabled = false,
      },
      document_highlight = {
        enabled = true,
      },
    }

    vim.diagnostic.config(config)

    local capabilities

    if presentCmpNvimLsp then
      capabilities = cmp_lsp.default_capabilities()
    else
      capabilities = vim.lsp.protocol.make_client_capabilities()
    end

    if presentLspStatus then
      lsp_status.register_progress()
      capabilities = vim.tbl_extend("keep", capabilities, lsp_status.capabilities)
    end

    if presentUfo then
      capabilities.textDocument.foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true,
      }
    end

    local servers = {
      bashls = {},
      yamlls = require("lt.plugins.lsp.servers.yamlls")(capabilities),
      jsonls = require("lt.plugins.lsp.servers.jsonls")(capabilities),
      html = {},
      cssls = {},
      lua_ls = require("lt.plugins.lsp.servers.lua_ls")(on_attach),
      dockerls = {},
      -- csharp_ls = {},
      -- omnisharp = {},
      -- volar=vue
      volar = {},
      graphql = {},
      -- rust_analyzer = {},
      eslint = require("lt.plugins.lsp.servers.eslint")(on_attach),
      -- svelte = {},
      angularls = {},
      tailwindcss = {},
      texlab = {},
      ansiblels = {},
      gopls = {},
      golangci_lint_ls = {},
      terraformls = {},
      clangd = {},
      -- azure_pipelines_ls = {},
      powershell_es = {},
      pyright = require("lt.plugins.lsp.servers.pyright")(on_attach),
      -- ruff_lsp = {},
      -- pylsp = {},
    }

    local default_lsp_config = {
      on_attach = on_attach,
      capabilities = capabilities,
      flags = {
        debounce_text_changes = 200,
        allow_incremental_sync = true,
      },
    }

    local server_names = {}
    for server_name, _ in pairs(servers) do
      table.insert(server_names, server_name)
    end
    -- setupped by typescript package so we need to ensure installed by mason
    table.insert(server_names, "tsserver")

    local present_mason, mason = pcall(require, "mason-lspconfig")
    if present_mason then
      mason.setup({ ensure_installed = server_names })
    else
      vim.notify("mason not there, cannot install lsp servers")
    end

    local present_typescript, typescript = pcall(require, "typescript-tools")

    if present_typescript then
      typescript.setup({
        on_attach = on_attach,
        expose_as_code_action = "all",
        settings = {
          tsserver_file_preferences = {
            -- includeInlayParameterNameHints = "all",
            includeInlayParameterNameHints = nil,
            importModuleSpecifierPreference = "non-relative",
          },
          -- code_lens = "implementations_only",
        },
      })
    end

    for server_name, server_config in pairs(servers) do
      local merged_config = vim.tbl_deep_extend("force", default_lsp_config, server_config)

      lspconfig[server_name].setup(merged_config)

      if server_name == "rust_analyzer" then
        local present_rust_tools, rust_tools = pcall(require, "rust-tools")

        if present_rust_tools then
          rust_tools.setup({ server = merged_config })
        end
      end
    end

    ufo.setupWithFallback()
  end,
}
