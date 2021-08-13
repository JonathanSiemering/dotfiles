local g = vim.g

g.completion_matching_strategy_list = { 'exact', 'substring', 'fuzzy' }
g.completion_menu_length = 1
g.completion_trigger_on_delete = 1

local lsp = require('lspconfig')
local completion = require('completion')

-- Go
lsp.gopls.setup{
    on_attach = completion.on_attach
}

-- C#
lsp.omnisharp.setup{
    cmd = {
        "/home/jonathan/.local/omnisharp/run",
        "--languageserver",
        "--hostPID",
        tostring(vim.fn.getpid())
    },
    on_attach = completion.on_attach
}

-- C++
lsp.ccls.setup{
    on_attach = completion.on_attach
}

-- Lua
lsp.sumneko_lua.setup{
    cmd = { "/usr/sbin/lua-language-server" },
    on_attach = completion.on_attach
}
