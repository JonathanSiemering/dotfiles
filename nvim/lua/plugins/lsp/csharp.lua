local lsp = require('lspconfig')

lsp.omnisharp.setup{
    cmd = {
        os.getenv('HOME') .. "/.local/share/nvim/mason/packages/omnisharp/omnisharp",
    }
}
