lua require('lspconfig').omnisharp.setup{
        \   cmd = {
        \       "/home/jonathan/.local/omnisharp/run",
        \       "--languageserver",
        \       "--hostPID",
        \       tostring(vim.fn.getpid())
        \   }
        \ }
