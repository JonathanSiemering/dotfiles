return {
    'CopilotC-Nvim/CopilotChat.nvim',
    dependencies = {
      { "nvim-lua/plenary.nvim", branch = "master" },
    },
    opts = {
        headers = {
            user = '👤 You',
            assistant = '🤖 Copilot',
            tool = '🔧 Tool',
        },
        auto_fold = true,
    },
}
