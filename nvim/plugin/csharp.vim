lua require('lspconfig').omnisharp.setup{
        \   cmd = {
        \       "/home/jonathan/.local/omnisharp/run",
        \       "--languageserver",
        \       "--hostPID",
        \       tostring(vim.fn.getpid())
        \   },
        \   on_attach=require('completion').on_attach 
        \ }
