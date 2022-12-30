local r = require("lt.utils.remaps")
local vim = vim

local M = {}

local telescope_builtin = require("telescope.builtin")
local lsp_functions = require("lt.plugins.lsp.functions")

local function generate_buf_keymapper(bufnr)
  return function(type, input, output, description, extraOptions)
    local options = { buffer = bufnr }
    if extraOptions ~= nil then
      options = vim.tbl_deep_extend("force", options, extraOptions)
    end
    r.noremap(type, input, output, description, options)
  end
end

function M.set_default_on_buffer(client, bufnr)
  local buf_set_keymap = generate_buf_keymapper(bufnr)
  local filetype = vim.api.nvim_buf_get_option(bufnr or 0, "filetype")
  local is_typescript = filetype == "typescript" or filetype == "typescriptreact"

  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  local cap = client.server_capabilities

  buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

  -- gives definition & references
  -- buf_set_keymap('n','<leader>tt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)

  if cap.definitionProvider then
    buf_set_keymap("n", "gd", vim.lsp.buf.definition, "Preview definition")
  end
  -- if cap.declarationProvider then
  -- map('n', 'gd', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  -- end
  if cap.implementationProvider then
    buf_set_keymap("n", "gi", vim.lsp.buf.implementation, "Go to implementation")
  end

  if cap.referencesProvider then
    -- buf_set_keymap('n','<leader>tr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap("n", "gr", telescope_builtin.lsp_references, "Show references")
    -- buf_set_keymap('n', 'gr', '<cmd>Trouble lsp_references<cr>', 'lsp',
    --                'lsp_references', 'Show references')
  end

  if cap.hoverProvider then
    buf_set_keymap("n", "K", vim.lsp.buf.hover, "Hover documentation")
  end

  if cap.documentSymbolProvider then
    -- buf_set_keymap('n','<leader>to', '<cmd>lua vim.lsp.buf.document_symbol()<CR>', opts)
    buf_set_keymap("n", "<leader>tO", telescope_builtin.lsp_document_symbols, "Document symbols")

    if pcall(require, "aerial") then
      buf_set_keymap("n", "<leader>to", "<cmd>AerialToggle!<CR>", "(Aerial) Document symbols")
    end
  end

  buf_set_keymap("n", "<leader>ts", vim.lsp.buf.signature_help, "Show signature")

  buf_set_keymap("n", "<leader>te", lsp_functions.show_diagnostics, "Show diagnostics")
  buf_set_keymap("n", "<leader>tE", vim.diagnostic.open_float, "Show line diagnostics")

  buf_set_keymap("n", "[e", vim.diagnostic.goto_prev, "Previous diagnostic")
  buf_set_keymap("n", "]e", vim.diagnostic.goto_next, "next diagnostic")

  -- if cap.workspaceSymbolProvider then
  --   map('n','<leader>gW','<cmd>lua vim.lsp.buf.workspace_symbol()<CR>', opts)
  -- end

  if cap.codeActionProvider then
    buf_set_keymap("n", "<leader>ra", vim.lsp.buf.code_action, "Code actions")
    buf_set_keymap("v", "<leader>ra", vim.lsp.buf.code_action, "Code actions")
  end

  -- when sumneko lua will be able to format we can reput the capabilities
  -- if cap.documentFormattingProvider then
  buf_set_keymap("n", "<leader>rf", function()
    vim.lsp.buf.format({
      async = true,
      bufnr = bufnr,
      filter = function(format_client)
        if is_typescript then
          if format_client.name == "null-ls" then
            --[[ vim.notify("format " .. filetype .. " with " .. format_client.name) ]]
            return true
          else
            return false
          end
        end

        --[[ vim.notify("format " .. filetype .. " with " .. format_client.name) ]]
        return true
      end,
    })
  end, "Format")
  -- elseif cap.documentRangeFormattingProvider then
  -- buf_set_keymap("n", "<leader>tf", vim.lsp.buf.formatting, "lsp_range_format", "Format")
  -- end

  r.which_key("<leader>ri", "import")

  buf_set_keymap("n", "<leader>rio", function()
    if is_typescript then
      local typescript = require("typescript")
      typescript.actions.organizeImports()
    end
  end, "Organize imports (TS)")

  buf_set_keymap("n", "<leader>riu", function()
    if is_typescript then
      local typescript = require("typescript")
      typescript.actions.removeUnused()
    end
  end, "Remove unused variables (TS)")

  buf_set_keymap("n", "<leader>rim", function()
    if is_typescript then
      local typescript = require("typescript")
      typescript.actions.addMissingImports()
    end
  end, "Import all (TS)")

  if cap.renameProvider then
    buf_set_keymap("n", "<leader>rr", vim.lsp.buf.rename, "Rename")
  end

  buf_set_keymap("n", "<leader>lsc", function()
    print(vim.inspect(vim.lsp.get_active_clients()))
  end, "LSP clients")

  buf_set_keymap("n", "<leader>lsl", function()
    print(vim.lsp.get_log_path())
  end, "Show log path")

  buf_set_keymap("n", "<leader>lsa", ":LspInfo()<CR>", "LSP Info")
end

r.which_key("<leader>ls", "servers")

r.noremap("n", "<leader>lsu", lsp_functions.lsp_install_servers, "Installer LSP servers")
r.noremap("n", "<leader>lsi", "<cmd>LspInstallInfo<CR>", "LSP servers install info")

return M
