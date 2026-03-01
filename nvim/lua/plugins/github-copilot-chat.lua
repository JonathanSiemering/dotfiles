return {
    'CopilotC-Nvim/CopilotChat.nvim',
    dependencies = {
      { "nvim-lua/plenary.nvim", branch = "master" },
    },
    opts = {
        model = 'gpt-5-mini',
        headers = {
            user = '👤 You',
            assistant = '🤖 Copilot',
            tool = '🔧 Tool',
        },
        auto_fold = true,
    },
    config = function()
        -- Auto-command to customize chat buffer behavior
        vim.api.nvim_create_autocmd('BufEnter', {
          pattern = 'copilot-*',
          callback = function()
            vim.opt_local.relativenumber = false
            vim.opt_local.number = false
            vim.opt_local.conceallevel = 0
          end,
        })
    end,
}
