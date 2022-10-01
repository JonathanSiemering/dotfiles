local M = {}

function M:init()
    self.nvimPath = vim.fn.stdpath('config')
    self.dataPath = vim.fn.stdpath('data')

    self.lspErrorIcon = ''
    self.lspWarningIcon = ''
    self.lspHintIcon = ''
    self.lspInfoIcon = ''

    self.gitAddIcon = ''
    self.gitModifiedIcon = ''
    self.gitRemoveIcon = ''
    self.gitFileUnstaged = ''
    self.gitFileStaged = ''
    self.gitFileUnmerged = ''
    self.gitFileRenamed = ''
    self.gitFileUntracked = ''
    self.gitFileDeleted = ''
    self.gitFileIgnored = ''
end

M:init()
return M
