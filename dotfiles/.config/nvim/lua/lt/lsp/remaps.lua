local r = require("lt.utils.remaps")

local M = {}

function M.set_default_on_buffer(client, bufnr)
	local function buf_set_keymap(...)
		r.bufnoremap(bufnr, ...)
	end
	local function buf_set_option(...)
		vim.api.nvim_buf_set_option(bufnr, ...)
	end
	local cap = client.server_capabilities

	buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

	-- gives definition & references
	-- buf_set_keymap('n', '<leader>tt', "<cmd>lua require'lspsaga.provider'.lsp_finder()<CR>", 'lsp', 'lsp_definitions_references', 'Find definitions and references')
	-- buf_set_keymap('n','<leader>tt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)

	if cap.definitionProvider then
		-- buf_set_keymap('n', 'gD', "<cmd>lua require'lspsaga.provider'.preview_definition()<CR>", 'lsp', 'lsp_preview_definition_saga', 'Preview definition')
		buf_set_keymap(
			"n",
			"gd",
			"<cmd>lua vim.lsp.buf.definition()<CR>",
			"lsp",
			"lsp_preview_definition",
			"Preview definition"
		)
	end
	-- if cap.declarationProvider then
	-- map('n', 'gd', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
	-- end
	if cap.implementationProvider then
		buf_set_keymap(
			"n",
			"gi",
			"<cmd>lua vim.lsp.buf.implementation()<CR>",
			"lsp",
			"lsp_goto_implementation",
			"Go to implementation"
		)
	end
	if cap.referencesProvider then
		-- buf_set_keymap('n','<leader>tr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
		buf_set_keymap(
			"n",
			"gR",
			"<cmd>lua require('telescope.builtin').lsp_references()<CR>",
			"lsp",
			"lsp_references",
			"Show references"
		)
		-- buf_set_keymap('n', 'gR', '<cmd>Trouble lsp_references<cr>', 'lsp',
		--                'lsp_references', 'Show references')
	end

	if cap.hoverProvider then
		-- buf_set_keymap('n','<leader>th', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
		buf_set_keymap(
			"n",
			"<leader>th",
			"<cmd>lua require('lspsaga.hover').render_hover_doc()<CR>",
			"lsp",
			"lsp_hover_docs",
			"Hover documentation"
		)

		buf_set_keymap("n", "<leader>tt", "<cmd>Trouble<cr>", "lsp", "lsp_trouble", "Trouble")
	end

	if cap.documentSymbolProvider then
		-- buf_set_keymap('n','<leader>to', '<cmd>lua vim.lsp.buf.document_symbol()<CR>', opts)
		buf_set_keymap(
			"n",
			"<leader>tO",
			"<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>",
			"lsp",
			"lsp_document_symbols",
			"Document symbols"
		)
		buf_set_keymap(
			"n",
			"<leader>to",
			"<cmd>Aerial!<CR>",
			"lsp",
			"lsp_aerial_document_symbols",
			"(Aerial) Document symbols"
		)
	end

	buf_set_keymap(
		"n",
		"<leader>ts",
		"<cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>",
		"lsp",
		"lsp_signature_help",
		"Show signature"
	)

	-- if cap.workspaceSymbolProvider then
	--   map('n','<leader>gW','<cmd>lua vim.lsp.buf.workspace_symbol()<CR>', opts)
	-- end

	if cap.codeActionProvider then
		-- buf_set_keymap('n','<leader>fa', '<cmd>lua vim.lsp.buf.code_action()<CR>', 'lsp', 'lsp_', '')
		-- buf_set_keymap('v', '<leader>fa', "<cmd>'<,'>lua vim.lsp.buf.range_code_action()<cr>", 'lsp', 'lsp_', '')
		buf_set_keymap(
			"n",
			"<leader>fa",
			"<cmd>lua require('telescope.builtin').lsp_code_actions({ timeout = 1000 })<CR>",
			"lsp",
			"lsp_code_actions",
			"Code actions"
		)
		buf_set_keymap(
			"v",
			"<leader>fa",
			"<cmd>lua require('telescope.builtin').lsp_range_code_actions({ timeout = 1000 })<CR>",
			"lsp",
			"lsp_code_actions_in_visual",
			"Code actions (visual)"
		)
		--[[ buf_set_keymap('n', '<leader>fa', "<cmd>lua require('lspsaga.codeaction').code_action()<CR>", opts)
    buf_set_keymap('v', '<leader>fa', "<cmd>'<,'>lua require('lspsaga.codeaction').range_code_action()<CR>", opts) ]]
	end

	-- buf_set_keymap('n','<leader>fe', '<cmd>lua vim.diagnostic.set_loclist()<CR>', opts)
	-- buf_set_keymap('n','<leader>fe', '<cmd>:LspDiagnostics 0<CR>', opts)
	-- buf_set_keymap('n', '<leader>fe',
	--                '<cmd>lua require(\'lt.lsp.functions\').show_diagnostics()<CR>',
	--                'lsp', 'lsp_show_diagnostics', 'Show diagnostics')

	buf_set_keymap(
		"n",
		"<leader>fe",
		"<cmd>Trouble document_diagnostics<cr>",
		"lsp",
		"lsp_show_diagnostics",
		"Show diagnostics"
	)

	-- buf_set_keymap('n','<leader>fE', '<cmd>lua vim.diagnostic.show_line_diagnostics()<CR>', opts)
	buf_set_keymap(
		"n",
		"<leader>fE",
		"<cmd>lua require'lspsaga.diagnostic'.show_line_diagnostics()<CR>",
		"lsp",
		"lsp_show_line_diagnostics",
		"Show line diagnostics"
	)

	buf_set_keymap(
		"n",
		"[e",
		"<cmd>lua vim.diagnostic.goto_prev()<CR>",
		"lsp",
		"lsp_previous_diagnostic",
		"Previous diagnostic"
	)
	buf_set_keymap(
		"n",
		"]e",
		"<cmd>lua vim.diagnostic.goto_next()<CR>",
		"lsp",
		"lsp_next_diagnostic",
		"next diagnostic"
	)

	if cap.documentFormattingProvider then
		buf_set_keymap("n", "<leader>ff", "<cmd>lua vim.lsp.buf.formatting()<CR>", "lsp", "lsp_format", "Format")
	elseif cap.documentRangeFormattingProvider then
		buf_set_keymap("n", "<leader>ff", "<cmd>lua vim.lsp.buf.formatting()<CR>", "lsp", "lsp_format_2", "Format")
	end

	if cap.renameProvider then
		-- buf_set_keymap('n','<leader>rr','<cmd>lua vim.lsp.buf.rename()<CR>', opts)
		-- buf_set_keymap('n','<leader>rr', "<cmd>lua require('lspsaga.rename').rename()<CR>", 'lsp', 'lsp_rename', 'Rename')
		buf_set_keymap(
			"n",
			"<leader>rr",
			"<cmd>lua require('renamer').rename({ empty = true })<cr>",
			"lsp",
			"lsp_rename_empty",
			"Rename"
		)
		buf_set_keymap(
			"n",
			"<leader>rR",
			"<cmd>lua require('renamer').rename({ empty = false })<cr>",
			"lsp",
			"lsp_rename",
			"Rename with existing value"
		)
	end

	buf_set_keymap(
		"n",
		"<leader>flc",
		":lua print(vim.inspect(vim.lsp.get_active_clients()))<CR>",
		"lsp",
		"lsp_debug_clients",
		"[DEBUG] LSP clients"
	)
	buf_set_keymap(
		"n",
		"<leader>fll",
		":lua print(vim.lsp.get_log_path())<CR>",
		"lsp",
		"lsp_debug_logs",
		"[DEBUG] LSP show log path"
	)
	-- buf_set_keymap('n','<leader>fll', ":lua vim.cmd('e'..vim.lsp.get_log_path())<CR>", opts)
	buf_set_keymap("n", "<leader>fli", ":LspInfo()<CR>", "lsp", "lsp_info", "[DEBUG] LSP Info")

	-- map('n','gs','<cmd>lua vim.lsp.buf.signature_help()<CR>')
	-- map('n','gi','<cmd>lua vim.lsp.buf.implementation()<CR>')
	-- map('n','gt','<cmd>lua vim.lsp.buf.type_definition()<CR>')
	-- map('n','<leader>ah','<cmd>lua vim.lsp.buf.hover()<CR>')
	-- map('n','<leader>af','<cmd>lua vim.lsp.buf.code_action()<CR>')
	-- map('n','<leader>ee','<cmd>lua vim.lsp.util.show_line_diagnostics()<CR>')
	-- map('n','<leader>ai','<cmd>lua vim.lsp.buf.incoming_calls()<CR>')
	-- map('n','<leader>ao','<cmd>lua vim.lsp.buf.outgoing_calls()<CR>')
end

function M.set_typescript(client, bufnr)
	local function buf_set_keymap(...)
		r.bufnoremap(bufnr, ...)
	end
	local presentTsUtils, tsUtils = pcall(require, "nvim-lsp-ts-utils")

	if presentTsUtils then
		-- defaults
		tsUtils.setup({})

		-- required to fix code action ranges and filter diagnostics
		tsUtils.setup_client(client)
	end

	buf_set_keymap("n", "<leader>fo", ":TSLspOrganize<CR>", "lsp", "lsp_typescript_organize", "Organize imports")
	buf_set_keymap("n", "<leader>fc", ":TSLspFixCurrent<CR>", "lsp", "lsp_typescript_fix_current", "Fix current")
	-- buf_set_keymap("n", "gr", ":TSLspRenameFile<CR>", 'lsp', 'lsp_', '')
	buf_set_keymap("n", "<leader>fi", ":TSLspImportAll<CR>", "lsp", "lsp_typescript_import_all", "Import all")
end

r.nnoremap(
	"<leader>flu",
	'<cmd>lua require("lt.lsp.servers.functions").lsp_install_servers()<CR>',
	"lsp",
	"lsp_install_server",
	"Installer LSP servers"
)

r.nnoremap("<leader>fll", "<cmd>LspInstallInfo<CR>", "lsp", "lsp_install_server_info", "LSP servers install info")

return M
