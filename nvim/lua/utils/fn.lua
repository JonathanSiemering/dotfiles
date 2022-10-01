local M = {}

M.execute = function(cmd)
    local handle = io.popen(cmd)
    local result = handle:read('*a')
    handle:close()
    return result
end

M.exists = function(file)
    local ok, err, code = os.rename(file, file)
    if not ok then
        if code == 13 then
            -- Permission denied, but it exists
            return true
        end
    end
    if ok == nil then ok = false end
    return ok, err
end

M.isUpdate = function(deleteFile)
  local updateFile = require('utils.vars').nvimPath .. '/update'
  if M.exists(updateFile) then
    if deleteFile then os.remove(updateFile) end
    return true
  end
  return false
end

return M
