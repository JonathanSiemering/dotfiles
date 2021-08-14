local lspsaga = require('lspsaga')

lspsaga.init_lsp_saga{
    code_action_prompt = {
        enable = false
    },
    code_action_keys = {
        quit = '<esc>',
        exec = '<cr>'
    },
    rename_action_keys = {
        quit = '<esc>',
        exec = '<cr>'
    }
}
