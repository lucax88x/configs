local functions = require 'lt.utils.functions'

_G.reload = function()
    local counter = 0

    for moduleName in pairs(package.loaded) do
        if functions.starts_with(moduleName, 'lt.') then
            package.loaded[moduleName] = nil
            require(moduleName)
            counter = counter + 1
        end
    end

    -- clear nvim-mapper keys
    vim.g.mapper_records = nil

    print('Reloaded ' .. counter .. ' modules!')
end

