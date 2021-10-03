local o = vim.o
local compe = require('cmp')

o.completeopt = "menuone,noselect"

compe.setup{
    sources = {
        { name = 'nvim_lsp' },
        { name = 'buffer' },
        { name = 'path' },
        { name = 'calc' }
    }
}
