local wk = require('which-key')

wk.setup({

})

wk.register({
    f = {
        name = 'Finder',
        f = {"<cmd>lua require('telescope.builtin').find_files()<cr>", "File"},
        F = {"<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>", "In current buffer"},
        g = {"<cmd>lua require('telescope.builtin').live_grep()<cr>", "Grep"},
        b = {"<cmd>lua require('telescope.builtin').buffers()<cr>", "Buffer"},
        h = {"<cmd>lua require('telescope.builtin').help_tags()<cr>", "In help"},
    },
    d = {
        name = 'Diagnostics',
        f = {"<cmd>lua require('telescope.builtin').lsp_references()<cr>", "Function reference"},
        F = {"<cmd>lua require('telescope.builtin').lsp_definitions()<cr>", "Function definitions"},
        e = {"<cmd>lua require('telescope.builtin').lsp_document_diagnostics()<cr>", "Diagnostics file"},
        E = {"<cmd>lua require('telescope.builtin').lsp_workspace_diagnostics()<cr>", "Diagnostics workspace"},
        a = {"<cmd>lua require('lspsaga.codeaction').code_action()<cr>", "Code actions"},
        A = {"<cmd>lua require('lspsaga.codeaction').range_code_action()<cr>", "Range code actions"},
        d = {"<cmd>lua require('lspsaga.hover').render_hover_doc()<cr>", "Show document"},
        D = {"<cmd>lua require('lspsaga.signaturehelp').signature_help()<cr>", "Show signature"},
        r = {"<cmd>lua require('lspsaga.rename').rename()<cr>", "Function rename"},
        s = {"<cmd>lua require('lspsaga.provider').preview_definition()<cr>", "Preview definition"},
    },
    g = {
        name = 'Git',
        b = {"<cmd>lua require('telescope.builtin').git_branches()<cr>", "Branches"},
        s = {"<cmd>G<cr>", "Status"},
        c = {"<cmd>Git commit<cr>", "Commit"},
        p = {"<cmd>Git push<cr>", "Push"},
        o = {"<cmd>Git pull<cr>", "Pull"},
        j = {"cmd>diffget //3<cr>", "Merge use mine"},
        f = {"cmd>diffget //2<cr>", "Merge use theres"},
    },
    t = {"<cmd>lua require('lspsaga.floaterm').open_float_terminal()<cr>", "Open floating terminal"}
}, { prefix = '<leader>' })
