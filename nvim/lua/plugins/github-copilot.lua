return {
    {
        'zbirenbaum/copilot.lua',
        cmd = 'Copilot',
        config = function()
            require('copilot').setup({
                -- Disable inline suggestions; completions are handled via copilot-cmp
                suggestion = { enabled = false },
                panel = { enabled = false },
            })
        end,
    },
    {
        'zbirenbaum/copilot-cmp',
        config = function()
            require('copilot_cmp').setup()
        end,
    },
    {
        'CopilotC-Nvim/CopilotChat.nvim',
        dependencies = {
          { "nvim-lua/plenary.nvim", branch = "master" },
        },
        opts = {
            model = 'gpt-5-mini',
            window = {
                width = 80,
            },
            headers = {
                user = '👤 You',
                assistant = '🤖 Copilot',
                tool = '🔧 Tool',
            },
            auto_fold = true,
        },
    },
}
