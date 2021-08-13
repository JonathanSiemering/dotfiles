local M = {}

function M:init()
    self.nvimPath = vim.fn.stdpath('config')
    self.dataPath = vim.fn.stdpath('data')
end

M:init()
return M
