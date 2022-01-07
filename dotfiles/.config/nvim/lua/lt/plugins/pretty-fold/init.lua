local present, pretty_fold = pcall(require, "pretty-fold")
local present_preview, pretty_fold_preview = pcall(require, "pretty-fold.preview")

if not present then
	return
end

pretty_fold.setup({})

if not present_preview then
	return
end

pretty_fold_preview.setup_keybinding()
