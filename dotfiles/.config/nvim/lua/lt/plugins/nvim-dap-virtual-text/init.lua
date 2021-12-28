local present, nvim_dap_virtual_text = pcall(require, "nvim-dap-virtual-text")

if not present then
	return
end

nvim_dap_virtual_text.setup({})
