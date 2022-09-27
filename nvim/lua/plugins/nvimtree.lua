local g = vim.g
local tree = require('nvim-tree')
local vars = require('utils.vars')

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
        width = 50,
        number = true,
        relativenumber = true
    },
    renderer = {
        highlight_git = true
    },
    git = {
        ignore = true
    },
    actions = {
        open_file = {
            quit_on_open = true
        }
    }
}
