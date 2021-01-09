return function(language_server_path)
    local bin_path = language_server_path .. "/bash-language-server/bash-language-server"
    return {
        cmd = {bin_path, "--stdio"},
    }
end
