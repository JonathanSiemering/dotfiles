local wk = require('which-key')

wk.setup({})

wk.register({
    f = {
        name = 'Finder',
        f = {"<cmd>lua require('telescope.builtin').find_files()<cr>", "File"},
        c = {"<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>", "In current buffer"},
        g = {"<cmd>lua require('telescope.builtin').live_grep()<cr>", "Grep"},
        b = {"<cmd>lua require('telescope.builtin').buffers()<cr>", "Buffer"},
        h = {"<cmd>lua require('telescope.builtin').help_tags()<cr>", "In help"},
    },
    d = {
        name = 'Diagnostics',
        f = {"<cmd>lua require('telescope.builtin').lsp_references()<cr>", "Function reference"},
        d = {"<cmd>lua require('telescope.builtin').lsp_definitions()<cr>", "Function definitions"},
        e = {"<cmd>lua require('telescope.builtin').lsp_document_diagnostics()<cr>", "Diagnostics file"},
        w = {"<cmd>lua require('telescope.builtin').lsp_workspace_diagnostics()<cr>", "Diagnostics workspace"},
        a = {"<cmd>lua require('telescope.builtin').lsp_code_actions()<cr>", "Code actions"},
        s = {"<cmd>lua require('telescope.builtin').lsp_range_code_actions<cr>", "Range code actions"},
        j = {"<cmd>lua vim.lsp.buf.hover()<cr>", "Show document"},
        k = {"<cmd>lua vim.lsp.buf.signature_help()<cr>", "Show signature"},
        r = {"<cmd>lua vim.lsp.buf.rename()<cr>", "Function rename"},
    },
    s = {
        name = 'Debug',
        c = {"<cmd>lua require('telescope').extensions.dap.commands{}<cr>", "Commands"},
        s = {"<cmd>lua require('telescope').extensions.dap.configurations{}<cr>", "Configurations"},
        b = {"<cmd>lua require('telescope').extensions.dap.list_breakpoints{}<cr>", "List breakpoints"},
        v = {"<cmd>lua require('telescope').extensions.dap.variables{}<cr>", "Varibales"},
        f = {"<cmd>lua require('telescope').extensions.dap.frames{}<cr>", "Frames"},
    },
    g = {
        name = 'Git',
        b = {"<cmd>lua require('telescope.builtin').git_branches()<cr>", "Branches"},
        s = {"<cmd>G<cr>", "Status"},
        c = {"<cmd>Git commit<cr>", "Commit"},
        p = {"<cmd>Git push<cr>", "Push"},
        o = {"<cmd>Git pull<cr>", "Pull"},
        d = {"<cmd>Git diff<cr>", "Diff"},
        j = {"<cmd>diffget //3<cr>", "Merge use mine"},
        f = {"<cmd>diffget //2<cr>", "Merge use theres"},
    },
    b = {
        name = 'Buffer',
        d = {"<cmd>bdelete<cr>", "Delete"},
        n = {"<cmd>bn<cr>", "Next"},
        p = {"<cmd>bp<cr>", "Previus"}
    }
}, { prefix = '<leader>' })
