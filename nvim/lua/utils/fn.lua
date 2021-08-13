local M = {}

M.execute = function(cmd)
    local handle = io.popen(cmd)
    local result = handle:read('*a')
    handle:close()
    return result
end

return M
