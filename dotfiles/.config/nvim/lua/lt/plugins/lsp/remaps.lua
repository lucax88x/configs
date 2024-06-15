local r = require("lt.utils.remaps")
local vim = vim

local M = {}

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
  local filetype = vim.api.nvim_get_option_value("filetype", { buf = bufnr or 0 })
  local is_typescript = filetype == "typescript" or filetype == "typescriptreact"

  local cap = client.server_capabilities

  -- fn.tprint_keys(cap)

  vim.api.nvim_set_option_value("omnifunc", "v:lua.vim.lsp.omnifunc", { buf = bufnr or 0 })

  -- gives definition & references
  -- buf_set_keymap('n','<leader>tt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)

  if cap.definitionProvider then
    buf_set_keymap("n", "gd", vim.lsp.buf.definition, "Go to definition")

    if is_typescript then
      buf_set_keymap("n", "gD", function()
        local typescript = require("typescript-tools.api")
        typescript.go_to_source_definition(false)
      end, "Go to definition")
    end
  end
  -- if cap.declarationProvider then
  --   buf_set_keymap("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
  -- end
  if cap.implementationProvider then
    buf_set_keymap("n", "gi", vim.lsp.buf.implementation, "Go to implementation")
    -- buf_set_keymap("n", "gI", function()
    --   require("fzf-lua").lsp_implementations()
    -- end, "Search implementations")
    buf_set_keymap("n", "gI", "<cmd>Trouble lsp_implementations toggle focus=false<cr>", "Search implementations")
  end

  if cap.referencesProvider then
    -- buf_set_keymap("n", "gr", function()
    --   require("fzf-lua").lsp_references()
    -- end, "Show references")
    buf_set_keymap("n", "gr", "<cmd>Trouble lsp_references toggle focus=false<cr>", "Show references")
  end

  if cap.hoverProvider then
    buf_set_keymap("n", "K", vim.lsp.buf.hover, "Hover documentation")
  end

  if cap.documentSymbolProvider then
    -- buf_set_keymap('n','<leader>to', '<cmd>lua vim.lsp.buf.document_symbol()<CR>', opts)
    buf_set_keymap("n", "<leader>tO", function()
      require("fzf-lua").lsp_document_symbols()
    end, "Document symbols")

    if pcall(require, "aerial") then
      -- buf_set_keymap("n", "<leader>to", "<cmd>AerialToggle!<CR>", "(Aerial) Document symbols")
      buf_set_keymap("n", "<leader>to", "<cmd>Trouble lsp_document_symbols toggle focus=false<cr>", "Document symbols")
    end
  end

  buf_set_keymap("n", "<leader>ts", vim.lsp.buf.signature_help, "Show signature")

  -- buf_set_keymap("n", "<leader>te", function()
  --   require("fzf-lua").diagnostics_document()
  -- end, "Show diagnostics")
  buf_set_keymap("n", "<leader>tE", "<cmd>Trouble diagnostics toggle<cr>", "Show workspace diagnostics")
  buf_set_keymap("n", "<leader>te", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", "Show buffer diagnostics")
  -- buf_set_keymap("n", "<leader>tE", vim.diagnostic.open_float, "Show line diagnostics")

  -- if cap.workspaceSymbolProvider then
  --   map('n','<leader>gW','<cmd>lua vim.lsp.buf.workspace_symbol()<CR>', opts)
  -- end

  if cap.codeActionProvider then
    buf_set_keymap({ "n", "v" }, "<leader>ra", vim.lsp.buf.code_action, "Code actions")
    buf_set_keymap({ "n", "v" }, "<leader>rA", function()
      local line_count = vim.api.nvim_buf_line_count(bufnr)
      --[[ local range = vim.lsp.util.make_given_range_params({ 1, 1 }, { line_count, 1 }, bufnr) ]]
      local range = {
        start = { line = 1, character = 1 },
        ["end"] = { line = line_count, character = 1 },
      }

      vim.lsp.buf.code_action({ range = range.range })
    end, "Buffer code actions")
  end

  buf_set_keymap("n", "<leader>rf", function()
    require("conform").format({ bufnr = bufnr, lsp_fallback = true })
  end, "Format")

  if is_typescript then
    r.which_key("<leader>ri", "import")

    buf_set_keymap("n", "<leader>rio", function()
      local typescript = require("typescript-tools.api")
      typescript.organize_imports(false)
    end, "Organize imports (TS)")

    buf_set_keymap("n", "<leader>riu", function()
      local typescript = require("typescript-tools.api")
      typescript.remove_unused(false)
    end, "Remove unused variables (TS)")

    buf_set_keymap("n", "<leader>rim", function()
      local typescript = require("typescript-tools.api")
      typescript.add_missing_imports(false)
    end, "Import missing imports (TS)")
  end

  if cap.renameProvider then
    buf_set_keymap("n", "<leader>rR", vim.lsp.buf.rename, "Rename")
    -- buf_set_keymap("n", "<leader>rr", ":IncRename ", "Rename")
    --
    buf_set_keymap("n", "<leader>rr", function()
      return ":IncRename " .. vim.fn.expand("<cword>")
    end, "Rename", { expr = true })
  end

  buf_set_keymap("n", "<leader>lsc", function()
    print(vim.inspect(vim.lsp.get_clients()))
  end, "LSP clients")

  buf_set_keymap("n", "<leader>lsl", function()
    print(vim.lsp.get_log_path())
  end, "Show log path")

  buf_set_keymap("n", "<leader>lsa", ":LspInfo()<CR>", "LSP Info")
end

r.which_key("<leader>ls", "servers")

r.noremap("n", "<leader>lsi", "<cmd>LspInstallInfo<CR>", "LSP servers install info")

return M
