local wk = require('which-key')

wk.setup({})

wk.register({
    f = {
        name = 'Find',
        f = {"<cmd>lua require('telescope.builtin').find_files()<cr>", "File"},
        c = {"<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>", "In current buffer"},
        g = {"<cmd>lua require('telescope.builtin').live_grep()<cr>", "Grep"},
        b = {"<cmd>lua require('telescope.builtin').buffers()<cr>", "Buffer"},
        h = {"<cmd>lua require('telescope.builtin').help_tags()<cr>", "In help"},
        r = {"<cmd>lua require('telescope.builtin').registers()<cr>", "Registers"},
        m = {"<cmd>lua require('telescope.builtin').marks()<cr>", "Marks"},
        q = {"<cmd>lua require('telescope.builtin').quickfix()<cr>", "Quickfix"},
        s = {"<cmd>lua require('telescope.builtin').search_history()<cr>", "Search history"},
        t = {"<cmd>lua require('telescope.builtin').treesitter()<cr>", "Treesitter"},
        a = {"<cmd>NvimTreeFindFile<cr>", "File in NvimTree"},
    },
    l = {
        name = 'Lsp',
        f = {"<cmd>lua require('telescope.builtin').lsp_references()<cr>", "Function reference"},
        p = {"<cmd>lua require('telescope.builtin').lsp_definitions()<cr>", "Function definitions"},
        i = {"<cmd>lua require('telescope.builtin').lsp_implementations()<cr>", "Function implementations"},
        d = {"<cmd>lua require('telescope.builtin').diagnostics()<cr>", "Diagnostics"},
        j = {"<cmd>lua vim.lsp.buf.hover()<cr>", "Show document"},
        k = {"<cmd>lua vim.lsp.buf.signature_help()<cr>", "Show signature"},
        r = {"<cmd>lua vim.lsp.buf.rename()<cr>", "Function rename"},
        c = {"<cmd>lua vim.lsp.buf.code_action()<cr>", "Code action"},
    },
    u = {
        name = 'Debug',
        c = {"<cmd>lua require('telescope').extensions.dap.commands{}<cr>", "Commands"},
        s = {"<cmd>lua require('telescope').extensions.dap.configurations{}<cr>", "Configurations"},
        b = {"<cmd>lua require('telescope').extensions.dap.list_breakpoints{}<cr>", "List breakpoints"},
        v = {"<cmd>lua require('telescope').extensions.dap.variables{}<cr>", "Varibales"},
        f = {"<cmd>lua require('telescope').extensions.dap.frames{}<cr>", "Frames"},
    },
    g = {
        name = 'Git',
        c = {"<cmd>lua require('telescope.builtin').git_commits()<cr>", "Commits"},
        b = {"<cmd>lua require('telescope.builtin').git_bcommits()<cr>", "Commits of buffer"},
        s = {"<cmd>lua require('telescope.builtin').git_status()<cr>", "Git status"},
        t = {"<cmd>Gitsigns blame_line<cr>", "Git blame line"},
        l = {"<cmd>:wa<cr> <cmd>lua Lazygit_toggle()<cr>", "Lazygit"},
    },
    b = {
        name = 'Buffer',
        d = {"<cmd>bdelete<cr>", "Delete"},
        n = {"<cmd>bn<cr>", "Next"},
        p = {"<cmd>bp<cr>", "Previus"}
    },
    d = {"\"_d", "Delete to void"},
    s = {"<cmd>:wa<cr>", "Save all"}
}, { prefix = '<leader>' })
