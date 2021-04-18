return function(language_server_path)
    local bin_path = language_server_path .. "/docker-langserver/docker-langserver"
    return {
        cmd = {bin_path, "--stdio"},
    }
end
