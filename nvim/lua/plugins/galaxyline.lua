local gl = require('galaxyline')
local gls = gl.section

local seperator = '|'

gls.left = {
    {
        FileIcon = {
            provider = 'FileIcon'
        }
    },
    {
        FileName = {
            provider = 'FileName',
            separator = seperator .. ' '
        }
    },
    {
        FileFormat = {
            provider = 'FileFormat',
            separator = ' ' .. seperator
        }
    },
    {
        FileEncode = {
            provider = 'FileEncode',
            separator = ' ' .. seperator .. ' '
        }
    },
    {
        FileSize = {
            provider = 'FileSize'
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
            provider = 'GetLspClient'
        }
    },
    {
        GitBranch = {
            provider = 'GitBranch',
            separator = ' ' .. seperator .. ' '
        }
    },
    {
        LineColumn = {
            provider = 'LineColumn',
            separator = ' ' .. seperator
        }
    }
}
