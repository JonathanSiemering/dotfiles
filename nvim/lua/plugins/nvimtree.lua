return {
    'kyazdani42/nvim-tree.lua',
    dependencies = {'kyazdani42/nvim-web-devicons'},
    config = function()
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
                    error = vars.lspErrorIcon,
                },
            },
            view = {
                width = 50,
                number = true,
                relativenumber = true,
            },
            renderer = {
                highlight_git = true,
                icons = {
                    glyphs = {
                        git = {
                            unstaged = vars.gitFileUnstaged,
                            staged = vars.gitFileStaged,
                            unmerged = vars.gitFileUnmerged,
                            renamed = vars.gitFileRenamed,
                            untracked = vars.gitFileUntracked,
                            deleted = vars.gitFileDeleted,
                            ignored= vars.gitFileIgnored,
                        },
                    },
                },
            },
            git = {
                ignore = false,
            },
            actions = {
                open_file = {
                    quit_on_open = true,
                },
            },
        }
    end
}
