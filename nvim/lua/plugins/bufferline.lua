return {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
        local vars = require('utils.vars')
        local bufferline = require('bufferline')

        bufferline.setup{
            options = {
                mode = "buffers",
                style_preset = bufferline.style_preset.thick,
                numbers = 'ordinal',
                close_icon = '',
                buffer_close_icon = '',
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
    end
}
