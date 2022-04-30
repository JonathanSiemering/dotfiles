local lsp = require('lspconfig')

lsp.ccls.setup({
    cmd = {
        os.getenv('HOME') .. "/.local/share/nvim/lsp_servers/ccls/bin/ccls"
    }
})
