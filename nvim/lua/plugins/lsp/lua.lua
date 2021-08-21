local lsp = require('lspconfig')

lsp.sumneko_lua.setup{
    cmd = {
        os.getenv('HOME') .. "/lua/lua-language-server/bin/Linux/lua-language-server",
        os.getenv('HOME') .. "/lua/lua-language-server/main.lua"
    }
}
