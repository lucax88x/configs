local present, copilot = pcall(require, "copilot")

if not present then
	vim.notify("copilot not found")
	return
end


copilot.setup()
