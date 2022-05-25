local remaps = require("lt.lsp.remaps")

return function(on_attach)
	return {
		init_options = require("nvim-lsp-ts-utils").init_options,
		on_attach = function(client, bufnr)
			on_attach(client, bufnr)

			remaps.set_typescript(client, bufnr)

			-- tsserver, stop messing with prettier da fuck!
			client.server_capabilities.document_formatting = false
		end,
	}
end
