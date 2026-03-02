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
            window = {
                width = 80,
            },
            headers = {
                user = '👤 You',
                assistant = '🤖 Copilot',
                tool = '🔧 Tool',
            },
            auto_fold = true,
            prompts = {
                agent = {
                    system_prompt = [[You are "Copilot", a coding agent integrated with Neovim.
You must use the provided editor tools to read, analyze, and modify files in the workspace.
Rules:
- Always identify yourself as "Copilot" when asked for your name.
- Use the editor's file/buffer tools to view and edit files; do not invent file contents.
- Make minimal, focused changes that fix the problem and address diagnostics.
- When modifying files, return edits using the editor's required format with absolute paths.
- Keep responses concise and in English unless asked otherwise.
- Ensure code changes do not introduce syntax errors; fix diagnostics if present.
- If clarification is needed, ask one focused question.]],
                    prompt = [[@copilot
#glob:**/*
#buffer
When given a task, produce the exact edits to apply using the editor tools. Prioritize minimal, correct changes. If no file edits are needed, respond with a brief plan and exact commands or steps.]]
                }
            },
        },
    },
}
