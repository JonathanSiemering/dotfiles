local o = vim.o
local compe = require('compe')

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
