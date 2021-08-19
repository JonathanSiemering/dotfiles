local bufferline = require('bufferline')

bufferline.setup{
    options = {
        show_close_icon = false,
        show_buffer_close_icons = false,
        separator_style = 'thick',
        diagnostics = 'nvim_lsp'
    }
}
