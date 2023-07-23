local M = {}

function M.flash(screen)
	local flash = hs.canvas.new(screen:fullFrame()):appendElements({
		action = "fill",
		fillColor = { alpha = 0.25, red = 1 },
		type = "rectangle",
	})
	flash:show()
	hs.timer.doAfter(0.15, function()
		flash:delete()
	end)
end

return M
