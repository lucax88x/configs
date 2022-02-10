local present, quick_switcher = pcall(require, "nvim-quick-switcher")

if not present then
	return
end

local r = require("lt.utils.remaps")

r.which_key("<leader>o", "quick-switcher")

r.noremap("n", "<leader>oc", function()
	quick_switcher.switch("component.ts")
end, "quick_switcher", "Switch to component code")

r.noremap("n", "<leader>ov", function()
	quick_switcher.toggle("component.ts", "vue")
end, "quick_switcher", "Toggles vue to component")

r.noremap("n", "<leader>os", function()
	quick_switcher.switch("scss")
end, "quick_switcher", "Switch to scss")
