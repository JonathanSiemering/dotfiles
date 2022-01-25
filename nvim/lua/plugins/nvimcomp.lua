local o = vim.o
local cmp = require('cmp')
local luasnip = require('luasnip')

o.completeopt = "menuone,noselect"

cmp.setup{
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'buffer' },
        { name = 'path' },
        { name = 'calc' },
        { name = 'luasnip' }
    }
}
