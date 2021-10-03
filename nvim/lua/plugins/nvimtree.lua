local g = vim.g

g.nvim_tree_ignore = { '.git', 'node_modules', '.cache' }
g.nvim_tree_gitignore = 1
g.nvim_tree_git_hl = 1

local tree = require('nvim-tree')
tree.setup{
    lsp_diagnostics = true,
    view = {
        width = 30
    }
}
