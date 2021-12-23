local present, lightspeed = pcall(require, "lightspeed")

if not present then
	return
end

local function lightspeed_highlight_settings()
	vim.cmd("highlight! LightspeedOneCharMatch guibg=#EBdbb2 guifg=#1d2021")
end

lightspeed.setup({})

lightspeed_highlight_settings()
