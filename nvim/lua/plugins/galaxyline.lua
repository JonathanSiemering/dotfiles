local gl = require('galaxyline')
local vsc = require('galaxyline.provider_vcs')

local gls = gl.section
local seperator = '|'

local gitProvider = function()
    local add = vsc.diff_add()
    if add == nil then add = '0 ' end

    local modified = vsc.diff_modified()
    if modified == nil then modified = '0 ' end

    local remove = vsc.diff_remove()
    if remove == nil then remove = '0 ' end

    return '+' .. add .. '~' .. modified .. '-' .. remove .. vsc.get_git_branch()
end

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
        FileTypeName = {
            provider = 'FileTypeName',
            separator = ' ' .. seperator .. ' '
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
        GitProvider = {
            provider = {gitProvider},
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
