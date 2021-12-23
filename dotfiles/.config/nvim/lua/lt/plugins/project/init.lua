local present, project = pcall(require, "project_nvim")

if not present then
	return
end

project.setup({
	patterns = { ".git", "package.json", ".projectile" },
})
