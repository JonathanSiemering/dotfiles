local vars = require('utils.vars')
local bufferline = require('bufferline')

bufferline.setup{
    options = {
        show_close_icon = false,
        show_buffer_close_icons = false,
        separator_style = 'thick',
        diagnostics = 'nvim_lsp',
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
            local s = ""
            for e, n in pairs(diagnostics_dict) do
                local sym = e == "error" and vars.lspErrorIcon or (e == "warning" and vars.lspWarningIcon or vars.lspHintIcon)
                s = s .. ' ' .. sym .. n
            end
            return s
        end
    }
}
