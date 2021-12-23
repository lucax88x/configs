local present, saga = pcall(require, "lspsaga")

if not present then
	return
end

saga.init_lsp_saga({
	use_saga_diagnostic_sign = false,
	finder_definition_icon = " ",
	finder_reference_icon = " ",
	rename_prompt_prefix = "",
	code_action_prompt = {
		enable = false,
	},
})
