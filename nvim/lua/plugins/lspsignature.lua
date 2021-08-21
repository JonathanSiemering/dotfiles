local signature = require('lsp_signature')

signature.setup({
    bind = true,
    floating_window = true,
    extra_trigger_chars = {"(",","}
})
