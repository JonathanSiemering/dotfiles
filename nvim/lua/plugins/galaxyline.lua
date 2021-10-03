local gl = require('galaxyline')
local vsc = require('galaxyline.provider_vcs')
local fi = require('galaxyline/provider_fileinfo')

local gls = gl.section
local seperator = '|'

gls.left = {
    {
        FileIcon = {
            provider = 'FileIcon',
            highlight = 'GruvboxAqua'
        }
    },
    {
        FileName = {
            provider = 'FileName',
            separator = seperator .. ' ',
            highlight = 'GruvboxBlue'
        }
    },
    {
        FileTypeName = {
            provider = 'FileTypeName',
            separator = ' ' .. seperator .. ' ',
            highlight = 'GruvboxYellow'
        }
    },
    {
        FileFormat = {
            provider = 'FileFormat',
            separator = ' ' .. seperator,
            highlight = 'GruvboxBlue'
        }
    },
    {
        FileEncode = {
            provider = 'FileEncode',
            separator = ' ' .. seperator .. ' ',
            highlight = 'GruvboxYellow'
        }
    },
    {
        FileSize = {
            provider = 'FileSize',
            separator = seperator .. ' ',
            highlight = 'GruvboxBlue'
        }
    },
    {
        LineColumn = {
            provider = {function()
                return vim.fn.line('.') .. ':' .. vim.fn.col('.') .. ' ' .. fi.current_line_percent():gsub('%s+', '')
            end},
            highlight = 'GruvboxYellow'
        }
    }
}

gls.right = {
    {
        DiagnosticError = {
            provider = 'DiagnosticError',
            icon = '',
            highlight = 'GruvboxRed'
        }
    },
    {
        DiagnosticWarn = {
            provider = 'DiagnosticWarn',
            icon = '',
            highlight = 'GruvboxYellow'
        }
    },
    {
        DiagnosticHint = {
            provider = 'DiagnosticHint',
            icon = '',
            highlight = 'GruvboxBlue'
        }
    },
    {
        DiagnosticInfo = {
            provider = 'DiagnosticInfo',
            icon = '',
            highlight = 'GruvboxBlue'
        }
    },
    {
        LspClient = {
            provider = 'GetLspClient',
            highlight = 'GruvboxAqua'
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
            icon = '',
            highlight = 'GruvboxGreen',
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
            icon = '',
            highlight = 'GruvboxYellow'
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
            icon = '',
            highlight = 'GruvboxRed'
        }
    },
    {
        GitBranch = {
            provider = 'GitBranch',
            icon = '',
            highlight = 'GruvboxAqua'
        }
    }
}
