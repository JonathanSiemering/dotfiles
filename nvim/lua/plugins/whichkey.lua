local wk = require('which-key')

wk.setup({

})

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
        a = {"<cmd>lua require('lspsaga.codeaction').code_action()<cr>", "Code actions"},
        q = {"<cmd>lua require('lspsaga.codeaction').range_code_action()<cr>", "Range code actions"},
        j = {"<cmd>lua require('lspsaga.hover').render_hover_doc()<cr>", "Show document"},
        k = {"<cmd>lua require('lspsaga.signaturehelp').signature_help()<cr>", "Show signature"},
        r = {"<cmd>lua require('lspsaga.rename').rename()<cr>", "Function rename"},
        s = {"<cmd>SymbolsOutline<cr>", "Symbols outline"},
        p = {"<cmd>lua require('lspsaga.provider').preview_definition()<cr>", "Preview definition"},
    },
    s = {
        name = 'Debug',
        b = {"<cmd>lua require('dap').toggle_breakpoint()<cr>", "Toggle breakpoint"},
        c = {"<cmd>lua require('dap').continue()<cr>", "Continue"},
        x = {"<cmd>lua require('dap').close()<cr>", "Close"},
        z = {"<cmd>lua require('dapui').close()<cr>", "Close UI"},
        j = {"<cmd>lua require('dap').step_over()<cr>", "Step over"},
        k = {"<cmd>lua require('dap').step_into()<cr>", "Step into"},
        v = {"<cmd>let g:dap_virtual_text = v:true<cr>", "Virtual text show"},
        V = {"<cmd>let g:dap_virtual_text = v:false<cr>", "Virtual text hide"}
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
