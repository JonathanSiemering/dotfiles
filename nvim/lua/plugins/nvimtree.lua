local g = vim.g
local tree = require('nvim-tree')
local vars = require('utils.vars')

g.nvim_tree_ignore = { '.git', 'node_modules', '.cache' }
g.nvim_tree_gitignore = 1
g.nvim_tree_git_hl = 1

tree.setup{
    diagnostics = {
        enable = true,
        icons = {
            hint = vars.lspHintIcon,
            info = vars.lspInfoIcon,
            warning = vars.lspWarningIcon,
            error = vars.lspErrorIcon
        }
    },
    view = {
        width = 30
    }
}
