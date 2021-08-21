local lsp = require('lspconfig')

lsp.omnisharp.setup{
    cmd = {
        os.getenv('HOME') .. "/.local/omnisharp/run",
        "--languageserver",
        "--hostPID",
        tostring(vim.fn.getpid())
    }
}
