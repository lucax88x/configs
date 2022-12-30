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

  -- if cap.workspaceSymbolProvider then
  --   map('n','<leader>gW','<cmd>lua vim.lsp.buf.workspace_symbol()<CR>', opts)
  -- end

  if cap.codeActionProvider then
    buf_set_keymap("n", "<leader>fa", vim.lsp.buf.code_action, "Code actions")
    buf_set_keymap("v", "<leader>fa", vim.lsp.buf.code_action, "Code actions")
  end

  -- buf_set_keymap('n','<leader>fe', '<cmd>lua vim.diagnostic.set_loclist()<CR>', opts)
  -- buf_set_keymap('n','<leader>fe', '<cmd>:LspDiagnostics 0<CR>', opts)
  buf_set_keymap("n", "<leader>fe", lsp_functions.show_diagnostics, "Show diagnostics")

  buf_set_keymap("n", "<leader>fE", vim.diagnostic.open_float, "Show line diagnostics")

  buf_set_keymap("n", "[e", vim.diagnostic.goto_prev, "Previous diagnostic")
  buf_set_keymap("n", "]e", vim.diagnostic.goto_next, "next diagnostic")

  -- when sumneko lua will be able to format we can reput the capabilities
  -- if cap.documentFormattingProvider then
  buf_set_keymap("n", "<leader>ff", function()
    vim.lsp.buf.format({
      async = true,
      bufnr = bufnr,
      filter = function(format_client)
        local filetype = vim.api.nvim_buf_get_option(bufnr or 0, "filetype")

        if filetype == "typescript" or filetype == "typescriptreact" then
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
  -- buf_set_keymap("n", "<leader>ff", vim.lsp.buf.formatting, "lsp_range_format", "Format")
  -- end

  if cap.renameProvider then
    buf_set_keymap("n", "<leader>fr", vim.lsp.buf.rename, "Rename")
  end

  buf_set_keymap("n", "<leader>lsc", function()
    print(vim.inspect(vim.lsp.get_active_clients()))
  end, "LSP clients")

  buf_set_keymap("n", "<leader>lsl", function()
    print(vim.lsp.get_log_path())
  end, "Show log path")

  buf_set_keymap("n", "<leader>lsa", ":LspInfo()<CR>", "LSP Info")
end

function M.set_typescript(bufnr)
  local buf_set_keymap = generate_buf_keymapper(bufnr)
  local typescript = require("typescript")

  buf_set_keymap("n", "<leader>fo", function()
    typescript.actions.organizeImports()
  end, "Organize imports")

  buf_set_keymap("n", "<leader>fu", function()
    typescript.actions.removeUnused()
  end, "Remove unused variables")

  buf_set_keymap("n", "<leader>fc", function()
    typescript.actions.fixAll()
  end, "Fix All problems")

  buf_set_keymap("n", "<leader>fi", function()
    typescript.actions.addMissingImports()
  end, "Import all")
end

r.which_key("<leader>ls", "servers")

r.noremap("n", "<leader>lsu", lsp_functions.lsp_install_servers, "Installer LSP servers")

r.noremap("n", "<leader>lsi", "<cmd>LspInstallInfo<CR>", "LSP servers install info")

return M
