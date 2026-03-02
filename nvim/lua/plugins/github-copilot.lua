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
                    system_prompt = [[You are an autonomous coding agent integrated with Neovim. You have tools to read files, inspect buffers, and apply edits directly to the filesystem.

Workflow:
1. Read the relevant files to understand context before making changes.
2. Plan the minimal set of changes needed to solve the problem.
3. Apply ALL edits using the editor tools with absolute file paths — never print code blocks as a substitute.
4. Verify your changes introduce no new syntax errors or broken logic.

Rules:
- CRITICAL: Never output code blocks that represent file changes. Always use the write/edit tool to apply changes directly to files.
- Never invent file contents — always use tools to read first.
- Make the smallest correct change; do not refactor unrelated code.
- Fix any diagnostics introduced by your edits.
- If clarification is needed, ask one focused question before proceeding.
- Respond in English unless asked otherwise.
- End with a brief summary: what files you changed and why.
- Code blocks in your response are ONLY for explaining concepts, never for delivering changes.]],
                    prompt = [[@copilot
#glob:**/*
#buffer
You are in agent mode. Use tools to read files, then apply ALL changes directly via editor tools — do NOT print code blocks as your output. Complete the task silently through tool calls, then summarize what you changed.

Task:]]
                }
            },
        },
    },
}
