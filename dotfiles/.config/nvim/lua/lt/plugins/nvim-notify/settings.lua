local present, notify = pcall(require, 'notify')

if not (present) then
	return
end

vim.notify = notify
