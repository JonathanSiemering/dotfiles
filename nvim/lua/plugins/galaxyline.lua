local gl = require('galaxyline')
local vsc = require('galaxyline.provider_vcs')

local gls = gl.section
local seperator = '|'

local lineColumn = function()
    return vim.fn.line('.') .. ':' .. vim.fn.col('.')
end

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
            provider = {lineColumn},
            highlight = 'GruvboxYellow'
        }
    }
}

gls.right = {
    {
        DiagnosticError = {
            provider = 'DiagnosticError',
            icon = 'E',
            highlight = 'GruvboxRed'
        }
    },
    {
        DiagnosticWarn = {
            provider = 'DiagnosticWarn',
            icon = 'W',
            highlight = 'GruvboxYellow'
        }
    },
    {
        DiagnosticHint = {
            provider = 'DiagnosticHint',
            icon = 'H',
            highlight = 'GruvboxBlue'
        }
    },
    {
        DiagnosticInfo = {
            provider = 'DiagnosticInfo',
            icon = 'I',
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
            provider = {function()
                local n = vsc.diff_add()
                if n == nil then n = '0 ' end
                return n
            end},
            icon = '+',
            highlight = 'GruvboxGreen',
            separator = ' ' .. seperator .. ' '
        }
    },
    {
        DiffModified = {
            provider = {function()
                local n = vsc.diff_modified()
                if n == nil then n = '0 ' end
                return n
            end},
            icon = '~',
            highlight = 'GruvboxYellow'
        }
    },
    {
        DiffRemove = {
            provider = {function()
                local n = vsc.diff_remove()
                if n == nil then n = '0 ' end
                return n
            end},
            icon = '-',
            highlight = 'GruvboxRed'
        }
    },
    {
        GitBranch = {
            provider = 'GitBranch',
            highlight = 'GruvboxAqua'
        }
    }
}
