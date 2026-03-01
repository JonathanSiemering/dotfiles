return {
    'CopilotC-Nvim/CopilotChat.nvim',
    dependencies = {
      { "nvim-lua/plenary.nvim", branch = "master" },
    },
    opts = {
        model = "claude-sonnet-4.6",
    },
}
