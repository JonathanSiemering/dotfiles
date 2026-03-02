# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Installation

Set `DOTFILES_OS` to `ubuntu`, `arch`, or `macos` before running:

```sh
export DOTFILES_OS="macos"
./install-helper.sh
```

For Linux, also set `DOTFILES_ARCH` to `arm` or `x86` (used by `scripts/download-neovim.sh`).

`install.sh` installs system packages, downloads plugins to `~/.local/`, then creates symlinks from the repo files directly into `~` and `~/.config/`. There is no stow or package manager — it's raw `ln -s` with prior removal of existing files.

## Repository Architecture

This is a symlink-based dotfiles repo. Files here are symlinked into place; editing them directly edits the live config.

**Shell configuration:**
- `.profile` — login shell env, PATH setup, aliases, fzf/kubectl/azure helpers; sourced by `.zshrc`
- `.zshrc` — zsh-specific settings (completions, vim mode, prompt, plugins)
- `.spaceshiprc.zsh` — spaceship prompt layout (user/host/dir/git on left; exitcode/time/k8s/azure on right)
- `.tmux.conf` — minimal tmux config with vi bindings and clipboard integration

**Neovim configuration** (`nvim/`):
- `init.lua` — sets `<Space>` as leader, bootstraps lazy.nvim, loads `lua/plugins/`
- `lua/settings.lua` — core editor settings (tabs=4, relative numbers, undodir)
- `lua/utils/vars.lua` — shared icon/variable definitions
- `lua/plugins/` — one file per plugin or plugin group; loaded automatically by lazy.nvim

Plugin file naming convention: files prefixed with numbers (e.g. `1000-catppuccin.lua`) load after unnumbered ones due to alphabetical sort — use this to control load order when there are dependencies.

**Key plugin groupings:**
- `lsp.lua` — mason, nvim-lspconfig, nvim-cmp, LuaSnip, lsp_signature
- `github-copilot.lua` / `github-copilot-chat.lua` — Copilot with custom chat model config
- `whichkey.lua` — all custom keybindings defined here (leader mappings, function keys, harpoon)
- `900-telescope.lua` — fuzzy finding (files, grep, buffers, git)
- `others.lua` — gitsigns, undotree, vim-commentary, autopairs, illuminate

**Neovim keybinding overview** (leader = `<Space>`):
- `<leader>a/r/s` — find files / grep / buffer search (telescope)
- `<leader>t` — file tree (nvim-tree); `F2` to toggle
- `<leader>q/w/f` — delete/prev/next buffer; `<leader>1-9` jump to buffer
- `<leader>n/e/h/i/j/l` — LSP: definition/references/diagnostics/hover/rename/code actions
- `<leader>x/c/v/b` — harpoon: add/menu/prev/next; `<leader>z1-9` jump to marked file
- `F3` — undotree, `F4` — symbols outline, `F5-F9` — DAP debugger

**macOS-only:** `.amethyst.yml` window manager config is symlinked only on macOS.

**Linux-only:** `xmonad/` contains xmonad WM + xmobar config; requires xmonad, xmobar, feh, dmenu, st.
