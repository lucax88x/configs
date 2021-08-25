return function(language_server_path)
    local pid = vim.fn.getpid();
    local bin_path = language_server_path .. "omnisharp-rosylin/run"
    return {
        cmd = {bin_path, "--languageserver", "--hostPID", tostring(pid) },
    }
end
