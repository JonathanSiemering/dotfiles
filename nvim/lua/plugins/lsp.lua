local o = vim.o
local lsp = require('lspconfig')
local compe = require('compe')
local signature = require('lsp_signature')

o.completeopt = "menuone,noselect"

compe.setup{
    enable = true;
    autocomplete = true;
    min_length = 1;
    preselect = 'disable';
    documentation = {};
    source = {
        path = true;
        buffer = true;
        calc = true;
        nvim_lsp = true;
        nvim_lua = true;
    }
}

-- Go
lsp.gopls.setup{}

-- C#
lsp.omnisharp.setup{
    cmd = {
        os.getenv('HOME') .. "/.local/omnisharp/run",
        "--languageserver",
        "--hostPID",
        tostring(vim.fn.getpid())
    }
}

-- C++
lsp.ccls.setup{}

-- Lua
lsp.sumneko_lua.setup{
    cmd = {
        os.getenv('HOME') .. "/lua/lua-language-server/bin/Linux/lua-language-server",
        os.getenv('HOME') .. "/lua/lua-language-server/main.lua"
    }
}

signature.setup({
    bind = true,
    floating_window = true,
    extra_trigger_chars = {"(",","}
})
