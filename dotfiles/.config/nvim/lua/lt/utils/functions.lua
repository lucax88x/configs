local M = {}

function M.starts_with(str, start) return str:sub(1, #start) == start end

function M.tprint(table) print(vim.inspect(table)) end

function M.link_highlight(from, to, override)
    local hl_exists, _ = pcall(vim.api.nvim_get_hl_by_name, from, false)
    if override or not hl_exists then
        vim.cmd(('highlight link %s %s'):format(from, to))
    end
end

function M.is_linux() return vim.loop.os_uname().sysname == 'Linux' end

return M;
