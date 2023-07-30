return {
    'folke/which-key.nvim',
    config = function()
        local o = vim.o
        local wk = require('which-key')

        o.timeoutlen = 400

        wk.setup({})

        wk.register({
            -- Find
            a = {"<cmd>lua require('telescope.builtin').find_files()<cr>", "Find File"},
            r = {"<cmd>lua require('telescope.builtin').live_grep()<cr>", "Grep"},
            s = {"<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>", "In current buffer search"},
            t = {"<cmd>:wa<cr><cmd>NvimTreeFindFile<cr>", "Find file in NvimTree"},

            q = {"<cmd>bdelete<cr>", "Delete buffer"},
            w = {"<cmd>bp<cr>", "Previus buffer"},
            f = {"<cmd>bn<cr>", "Next buffer"},
            -- p = paste void
            g = {"<cmd>lua require('telescope.builtin').quickfix()<cr>", "Quickfix search"},

            -- Lsp
            h = {"<cmd>lua vim.diagnostic.open_float()<cr>", "Show diagnostic"},
            n = {"<cmd>lua require('telescope.builtin').lsp_definitions()<cr>", "Function definitions"},
            e = {"<cmd>lua require('telescope.builtin').lsp_references()<cr>", "Function reference"},
            i = {"<cmd>lua vim.lsp.buf.hover()<cr>", "Show document"},
            o = {"<cmd>lua vim.lsp.buf.signature_help()<cr>", "Show signature"},

            j = {"<cmd>lua vim.lsp.buf.rename()<cr>", "Function rename"},
            l = {"<cmd>lua vim.lsp.buf.code_action()<cr>", "Code action"},
            u = {"<cmd>lua vim.diagnostic.goto_next()<cr>", "Next diagnostic"},
            y = {"<cmd>lua vim.diagnostic.goto_prev()<cr>", "Previus diagnostic"},

            k = {"<cmd>lua require('telescope.builtin').diagnostics()<cr>", "Diagnostics"},
            m = {"<cmd>lua require('telescope.builtin').diagnostics({bufnr = 0})<cr>", "Diagnostics buffer"},

            -- Harpoon
            x = {"<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", "Harpoon menu"},
            c = {"<cmd>lua require('harpoon.mark').add_file()<cr>", "Add file to harpoon"},
            v = {"<cmd>lua require('harpoon.ui').nav_prev()<cr>", "Harpoon prev file"},
            b = {"<cmd>lua require('harpoon.ui').nav_next()<cr>", "Harpoon next file"},

            d = {"\"_d", "Delete to void"},

            -- Layer 2
            z = {
                -- Dap
                name = "layer 2",
                h = {"<cmd>lua require('telescope').extensions.dap.commands{}<cr>", "DAP Commands"},
                n = {"<cmd>lua require('telescope').extensions.dap.configurations{}<cr>", "DAP Configurations"},
                e = {"<cmd>lua require('telescope').extensions.dap.list_breakpoints{}<cr>", "DAP Breakpoints"},
                i = {"<cmd>lua require('telescope').extensions.dap.variables{}<cr>", "DAP Varibales"},
                o = {"<cmd>lua require('telescope').extensions.dap.frames{}<cr>", "DAP Frames"},
                m = {"<cmd>lua require('dapui').eval() require('dapui').eval()<cr>", "DAP Variable eval"}, -- To calls to jump to window

                -- Git
                a = {"<cmd>:wa<cr> <cmd>lua Lazygit_toggle()<cr>", "Lazygit"},
                r = {"<cmd>lua require('telescope.builtin').git_commits()<cr>", "Git Commits"},
                s = {"<cmd>lua require('telescope.builtin').git_bcommits()<cr>", "Commits of buffer"},
                t = {"<cmd>lua require('telescope.builtin').git_status()<cr>", "Git status"},
                d = {"<cmd>Gitsigns blame_line<cr>", "Git blame line"},

                -- Notify
                x = {"<cmd>:Telescope notify<cr>", "Notifications"},

                -- Buffer
                q = {"<cmd>lua require('telescope.builtin').buffers()<cr>", "Find Buffer"},
                w = {"<cmd>lua require('telescope.builtin').treesitter()<cr>", "Treesitter search"},
                f = {"<cmd>lua require('telescope.builtin').registers()<cr>", "Registers search"},
            },
        }, { prefix = '<leader>' })

        -- Change Y to copy to end
        vim.cmd([[
            nnoremap Y y$
        ]])

        -- Move text
        vim.cmd([[
            nnoremap <c-j> :m .+1<cr>==
            nnoremap <c-l> :m .-2<cr>==
            inoremap <c-j> <esc>:m .+1<cr>==i
            inoremap <c-l> <esc>:m .-2<cr>==i
            vnoremap <c-j> :m '>+1<cr>gv=gv
            vnoremap <c-l> :m '<-2<cr>gv=gv
        ]])

        -- Menu
        vim.cmd([[
            nnoremap <F2> <cmd>:wa<CR><cmd>NvimTreeToggle<CR>
            nnoremap <F3> <cmd>UndotreeToggle<CR>
            nnoremap <F4> <cmd>SymbolsOutline<CR>
        ]])

        -- Debug
        vim.cmd([[
            nnoremap <F5> <cmd>lua require("dapui").open() require('dap').continue()<CR>
            nnoremap <F6> <cmd>lua require('dap').step_over()<CR>
            nnoremap <F7> <cmd>lua require('dap').step_into()<CR>
            nnoremap <F8> <cmd>lua require('dap').close() require('dapui').close() require('nvim-dap-virtual-text').refresh()<CR>
            nnoremap <F9> <cmd>lua require('dap').toggle_breakpoint()<CR>
        ]])

        -- Buffer
        vim.cmd([[
            nnoremap <silent><leader>1 <cmd>BufferLineGoToBuffer 1<CR>
            nnoremap <silent><leader>2 <cmd>BufferLineGoToBuffer 2<CR>
            nnoremap <silent><leader>3 <cmd>BufferLineGoToBuffer 3<CR>
            nnoremap <silent><leader>4 <cmd>BufferLineGoToBuffer 4<CR>
            nnoremap <silent><leader>5 <cmd>BufferLineGoToBuffer 5<CR>
            nnoremap <silent><leader>6 <cmd>BufferLineGoToBuffer 6<CR>
            nnoremap <silent><leader>7 <cmd>BufferLineGoToBuffer 7<CR>
            nnoremap <silent><leader>8 <cmd>BufferLineGoToBuffer 8<CR>
            nnoremap <silent><leader>9 <cmd>BufferLineGoToBuffer 9<CR>
        ]])

        -- Harpoon
        vim.cmd([[
            nnoremap <silent><leader>z1 <cmd>lua require('harpoon.ui').nav_file(1)<CR>
            nnoremap <silent><leader>z2 <cmd>lua require('harpoon.ui').nav_file(2)<CR>
            nnoremap <silent><leader>z3 <cmd>lua require('harpoon.ui').nav_file(3)<CR>
            nnoremap <silent><leader>z4 <cmd>lua require('harpoon.ui').nav_file(4)<CR>
            nnoremap <silent><leader>z5 <cmd>lua require('harpoon.ui').nav_file(5)<CR>
            nnoremap <silent><leader>z6 <cmd>lua require('harpoon.ui').nav_file(6)<CR>
            nnoremap <silent><leader>z7 <cmd>lua require('harpoon.ui').nav_file(7)<CR>
            nnoremap <silent><leader>z8 <cmd>lua require('harpoon.ui').nav_file(8)<CR>
            nnoremap <silent><leader>z9 <cmd>lua require('harpoon.ui').nav_file(9)<CR>
        ]])

        -- Save
        vim.cmd([[
            nnoremap <c-s> <cmd>:wa<CR>
        ]])

        -- Past to void
        vim.cmd([[
            xnoremap <leader>p "_dP
        ]])
    end
}

