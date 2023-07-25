return {
    'glepnir/galaxyline.nvim',
    dependencies = {'kyazdani42/nvim-web-devicons'},
    config = function()
        local vars = require('utils.vars')
        local gl = require('galaxyline')
        local vsc = require('galaxyline.provider_vcs')
        local fi = require('galaxyline/provider_fileinfo')

        local gls = gl.section
        local seperator = '|'

        gls.left = {
            {
                FileIcon = {
                    provider = 'FileIcon',
                    highlight = 'GalaxylineAqua'
                }
            },
            {
                FileName = {
                    provider = 'FileName',
                    separator = seperator .. ' ',
                    highlight = 'GalaxylineBlue'
                }
            },
            {
                FileTypeName = {
                    provider = 'FileTypeName',
                    separator = ' ' .. seperator .. ' ',
                    highlight = 'GalaxylineYellow'
                }
            },
            {
                FileFormat = {
                    provider = 'FileFormat',
                    separator = ' ' .. seperator,
                    highlight = 'GalaxylineBlue'
                }
            },
            {
                FileEncode = {
                    provider = 'FileEncode',
                    separator = ' ' .. seperator .. ' ',
                    highlight = 'GalaxylineYellow'
                }
            },
            {
                FileSize = {
                    provider = 'FileSize',
                    separator = seperator .. ' ',
                    highlight = 'GalaxylineBlue'
                }
            },
            {
                LineColumn = {
                    provider = {function()
                        return vim.fn.line('.') .. ':' .. vim.fn.col('.') .. ' ' .. fi.current_line_percent():gsub('%s+', '')
                    end},
                    highlight = 'GalaxylineYellow'
                }
            }
        }

        gls.right = {
            {
                DiagnosticError = {
                    provider = 'DiagnosticError',
                    icon = vars.lspErrorIcon,
                    highlight = 'GalaxylineRed'
                }
            },
            {
                DiagnosticWarn = {
                    provider = 'DiagnosticWarn',
                    icon = vars.lspWarningIcon,
                    highlight = 'GalaxylineYellow'
                }
            },
            {
                DiagnosticHint = {
                    provider = 'DiagnosticHint',
                    icon = vars.lspHintIcon,
                    highlight = 'GalaxylineBlue'
                }
            },
            {
                DiagnosticInfo = {
                    provider = 'DiagnosticInfo',
                    icon = vars.lspInfoIcon,
                    highlight = 'GalaxylineBlue'
                }
            },
            {
                LspClient = {
                    provider = 'GetLspClient',
                    highlight = 'GalaxylineAqua'
                }
            },
            {
                DiffAdd = {
                    provider = function()
                        local n = vsc.diff_add()
                        if n == nil then n = '0 ' end
                        return n
                    end,
                    condition = function()
                        local b = vsc.get_git_branch()
                        return b ~= nil and b ~= ''
                    end,
                    icon = vars.gitAddIcon,
                    highlight = 'GalaxylineGreen',
                    separator = ' ' .. seperator .. ' '
                }
            },
            {
                DiffModified = {
                    provider = function()
                        local n = vsc.diff_modified()
                        if n == nil then n = '0 ' end
                        return n
                    end,
                    condition = function()
                        local b = vsc.get_git_branch()
                        return b ~= nil and b ~= ''
                    end,
                    icon = vars.gitModifiedIcon,
                    highlight = 'GalaxylineYellow'
                }
            },
            {
                DiffRemove = {
                    provider = function()
                        local n = vsc.diff_remove()
                        if n == nil then n = '0 ' end
                        return n
                    end,
                    condition = function()
                        local b = vsc.get_git_branch()
                        return b ~= nil and b ~= ''
                    end,
                    icon = vars.gitRemoveIcon,
                    highlight = 'GalaxylineRed'
                }
            },
            {
                GitBranch = {
                    provider = 'GitBranch',
                    icon = '',
                    highlight = 'GalaxylineAqua'
                }
            }
        }
    end
}
