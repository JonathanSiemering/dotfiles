return {
    'folke/which-key.nvim',
    config = function()
        local wk = require('which-key')

        vim.opt.timeoutlen = 400

        wk.setup({})

        wk.add({
            -- Find
            { "<leader>a", "<cmd>lua require('telescope.builtin').find_files()<cr>", desc = "Find File" },
            { "<leader>r", "<cmd>lua require('telescope.builtin').live_grep()<cr>", desc = "Grep" },
            { "<leader>s", "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>", desc = "In current buffer search" },
            { "<leader>t", "<cmd>:wa<cr><cmd>NvimTreeFindFile<cr>", desc = "Find file in NvimTree" },

            { "<leader>q", "<cmd>bdelete<cr>", desc = "Delete buffer" },
            { "<leader>w", "<cmd>bp<cr>", desc = "Previous buffer" },
            { "<leader>f", "<cmd>bn<cr>", desc = "Next buffer" },
            { "<leader>g", "<cmd>lua require('telescope.builtin').quickfix()<cr>", desc = "Quickfix search" },

            -- LSP
            { "<leader>h", "<cmd>lua vim.diagnostic.open_float()<cr>", desc = "Show diagnostic" },
            { "<leader>n", "<cmd>lua require('telescope.builtin').lsp_definitions()<cr>", desc = "Function definitions" },
            { "<leader>e", "<cmd>lua require('telescope.builtin').lsp_references()<cr>", desc = "Function reference" },
            { "<leader>i", "<cmd>lua vim.lsp.buf.hover()<cr>", desc = "Show document" },
            { "<leader>o", "<cmd>lua vim.lsp.buf.signature_help()<cr>", desc = "Show signature" },

            { "<leader>j", "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "Function rename" },
            { "<leader>l", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code action" },
            { "<leader>u", "<cmd>lua vim.diagnostic.goto_next()<cr>", desc = "Next diagnostic" },
            { "<leader>y", "<cmd>lua vim.diagnostic.goto_prev()<cr>", desc = "Previous diagnostic" },

            { "<leader>k", "<cmd>lua require('telescope.builtin').diagnostics()<cr>", desc = "Diagnostics" },
            { "<leader>m", "<cmd>lua require('telescope.builtin').diagnostics({bufnr = 0})<cr>", desc = "Diagnostics buffer" },

            -- Harpoon
            { "<leader>x", function() require('harpoon'):list():add() end, desc = "Harpoon menu" },
            { "<leader>c", function() local harpoon = require('harpoon') harpoon.ui:toggle_quick_menu(harpoon:list()) end, desc = "Add file to harpoon" },
            { "<leader>v", function() require('harpoon'):list():prev() end, desc = "Harpoon prev file" },
            { "<leader>b", function() require('harpoon'):list():next() end, desc = "Harpoon next file" },

            { "<leader>d", "\"_d", desc = "Delete to void" },

            -- Layer 2
            { "<leader>z", group = "layer 2" },

            -- Git
            { "<leader>za", "<cmd>:wa<cr> <cmd>lua Lazygit_toggle()<cr>", desc = "Lazygit" },
            { "<leader>zr", "<cmd>lua require('telescope.builtin').git_commits()<cr>", desc = "Git Commits" },
            { "<leader>zs", "<cmd>lua require('telescope.builtin').git_bcommits()<cr>", desc = "Commits of buffer" },
            { "<leader>zt", "<cmd>lua require('telescope.builtin').git_status()<cr>", desc = "Git status" },
            { "<leader>zd", "<cmd>Gitsigns blame_line<cr>", desc = "Git blame line" },

            -- Notify
            { "<leader>zx", "<cmd>:Telescope notify<cr>", desc = "Notifications" },

            -- Buffer
            { "<leader>zq", "<cmd>lua require('telescope.builtin').buffers()<cr>", desc = "Find Buffer" },
            { "<leader>zw", "<cmd>lua require('telescope.builtin').treesitter()<cr>", desc = "Treesitter search" },
            { "<leader>zf", "<cmd>lua require('telescope.builtin').registers()<cr>", desc = "Registers search" },
        })

        -- Change Y to copy to end
        vim.keymap.set('n', 'Y', 'y$')

        -- Move text
        vim.keymap.set('n', '<c-j>', ':m .+1<cr>==')
        vim.keymap.set('n', '<c-l>', ':m .-2<cr>==')
        vim.keymap.set('i', '<c-j>', '<esc>:m .+1<cr>==i')
        vim.keymap.set('i', '<c-l>', '<esc>:m .-2<cr>==i')
        vim.keymap.set('v', '<c-j>', ':m \'>+1<cr>gv=gv')
        vim.keymap.set('v', '<c-l>', ':m \'<-2<cr>gv=gv')

        -- Menu
        vim.keymap.set('n', '<F2>', '<cmd>:wa<CR><cmd>NvimTreeToggle<CR>')
        vim.keymap.set('n', '<F3>', '<cmd>UndotreeToggle<CR>')
        vim.keymap.set('n', '<F4>', '<cmd>Outline<CR>')

        -- Debug
        vim.keymap.set('n', '<F5>', '<cmd>lua require("dapui").open() require(\'dap\').continue()<CR>')
        vim.keymap.set('n', '<F6>', '<cmd>lua require(\'dap\').step_over()<CR>')
        vim.keymap.set('n', '<F7>', '<cmd>lua require(\'dap\').step_into()<CR>')
        vim.keymap.set('n', '<F8>', '<cmd>lua require(\'dap\').close() require(\'dapui\').close() require(\'nvim-dap-virtual-text\').refresh()<CR>')
        vim.keymap.set('n', '<F9>', '<cmd>lua require(\'dap\').toggle_breakpoint()<CR>')

        -- Buffer
        for i = 1, 9 do
            vim.keymap.set('n', '<leader>' .. i, '<cmd>BufferLineGoToBuffer ' .. i .. '<CR>', { silent = true })
        end

        -- Harpoon
        for i = 1, 9 do
            vim.keymap.set('n', '<leader>z' .. i, function() require('harpoon'):list():select(i) end, { silent = true })
        end

        -- Save
        vim.keymap.set('n', '<c-s>', '<cmd>:wa<CR>')

        -- Paste to void
        vim.keymap.set('x', '<leader>p', '"_dP')

        -- Copilot
        vim.keymap.set('i', '<S-Right>', 'copilot#Accept("\\<CR>")', { expr = true, replace_keycodes = false })
        vim.keymap.set('i', '<C-Right>', '<Plug>(copilot-accept-line)')
        vim.keymap.set('i', '<C-Down>', '<Plug>(copilot-accept-word)')
        vim.keymap.set('i', '<S-Left>', '<Plug>(copilot-dismiss)')
        vim.keymap.set('i', '<S-Up>', '<Plug>(copilot-next)')
        vim.keymap.set('i', '<S-Down>', '<Plug>(copilot-previous)')
    end
}

