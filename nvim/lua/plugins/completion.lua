local o = vim.o

o.completeopt = "menuone,noselect"

local compe = require('compe')

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

local lsp = require('lspconfig')

-- Go
lsp.gopls.setup{}

-- C#
lsp.omnisharp.setup{
    cmd = {
        "/home/jonathan/.local/omnisharp/run",
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
        "/home/jonathan/lua/lua-language-server/bin/Linux/lua-language-server",
        "/home/jonathan/lua/lua-language-server/main.lua"
    }
}

local signature = require('lsp_signature')

signature.setup({
    bind = true,
    floating_window = true,
    extra_trigger_chars = {"(",","}
})
