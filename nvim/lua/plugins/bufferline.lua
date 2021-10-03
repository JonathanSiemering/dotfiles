local bufferline = require('bufferline')

bufferline.setup{
    options = {
        show_close_icon = false,
        show_buffer_close_icons = false,
        separator_style = 'thick',
        diagnostics = 'nvim_lsp',
        numbers = 'ordinal',
        number_style = '',
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
            local s = ""
            for e, n in pairs(diagnostics_dict) do
                local sym = e == "error" and "" or (e == "warning" and "" or "")
                s = s .. ' ' .. sym .. n
            end
            return s
        end
    }
}
