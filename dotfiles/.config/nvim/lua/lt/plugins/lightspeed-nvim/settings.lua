local present, lightspeed = pcall(require, 'lightspeed')

if not (present) then
	return
end

lightspeed.setup({});
