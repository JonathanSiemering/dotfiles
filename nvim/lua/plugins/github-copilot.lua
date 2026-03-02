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
            prompts = {
                agent = {
                    system_prompt = [[You are an autonomous coding agent integrated with Neovim. You have tools to read files, inspect buffers, and apply edits.

Workflow:
1. Read the relevant files to understand context before making changes.
2. Plan the minimal set of changes needed to solve the problem.
3. Apply edits using the editor tools with absolute file paths.
4. Verify your changes introduce no new syntax errors or broken logic.

Rules:
- Never invent file contents — always use tools to read first.
- Make the smallest correct change; do not refactor unrelated code.
- Fix any diagnostics introduced by your edits.
- If clarification is needed, ask one focused question before proceeding.
- Respond in English unless asked otherwise.
- End with a brief summary: what you changed and why.]],
                    prompt = [[@copilot
#glob:**/*
#buffer
You are in agent mode. Read files as needed, then apply focused edits to complete the task. End with a brief summary of what you changed and why.

Task:]]
                }
            },
        },
    },
}
