# Dotfiles

Symlink-based dotfiles for macOS, Ubuntu, and Arch Linux.

## Installation

Set `DOTFILES_OS` to `ubuntu`, `arch`, or `macos`, then run:

```sh
export DOTFILES_OS="macos"
./install-helper.sh
```

For Linux, also set `DOTFILES_ARCH` to `arm` or `x86` (used when downloading Neovim).

The installer will:
- Install system packages via your package manager
- Download plugins to `~/.local/`
- Symlink config files directly into `~` and `~/.config/`

## What's Included

### Shell
- **`.profile`** — login shell env, PATH, aliases, fzf/kubectl/azure helpers
- **`.zshrc`** — zsh settings: completions, vim mode, prompt, plugins
- **`.spaceshiprc.zsh`** — spaceship prompt (user/host/dir/git | exitcode/time/k8s/azure)

### Neovim (`nvim/`)
Full Neovim config using [lazy.nvim](https://github.com/folke/lazy.nvim).

**Plugins:**
- LSP — mason, nvim-lspconfig, nvim-cmp, LuaSnip, lsp_signature
- GitHub Copilot + Copilot Chat
- Telescope — fuzzy find files, grep, buffers, git
- Harpoon — quick file marks and navigation
- nvim-tree — file explorer
- Treesitter — syntax highlighting
- Catppuccin — colorscheme
- Galaxyline — statusline
- Bufferline — buffer tabs
- DAP — debugger
- Toggleterm, undotree, gitsigns, which-key, and more

**Keybindings** (leader = `<Space>`):

| Key | Action |
|-----|--------|
| `<leader>a` | Find files |
| `<leader>r` | Live grep |
| `<leader>s` | Search in current buffer |
| `<leader>g` | Quickfix search |
| `<leader>t` | Find file in tree (NvimTree) |
| `<leader>q` / `<leader>w` / `<leader>f` | Delete / prev / next buffer |
| `<leader>1-9` | Jump to buffer |
| `<leader>n` | LSP: go to definition |
| `<leader>e` | LSP: references |
| `<leader>h` | LSP: show diagnostic (float) |
| `<leader>i` | LSP: hover docs |
| `<leader>o` | LSP: signature help |
| `<leader>j` | LSP: rename |
| `<leader>l` | LSP: code action |
| `<leader>u` / `<leader>y` | Next / prev diagnostic |
| `<leader>k` / `<leader>m` | All diagnostics / buffer diagnostics |
| `<leader>x` | Harpoon: add file |
| `<leader>c` | Harpoon: open menu |
| `<leader>v` / `<leader>b` | Harpoon: prev / next file |
| `<leader>z1-9` | Jump to harpoon mark |
| `<leader>d` | Delete to void register |
| `<leader>p` (visual) | Paste without overwriting register |
| `<leader>za` | Lazygit |
| `<leader>zr` / `<leader>zs` | Git commits / buffer commits |
| `<leader>zt` | Git status |
| `<leader>zd` | Git blame line |
| `<leader>zx` | Notifications |
| `<leader>zq` | Find buffer |
| `<leader>zw` | Treesitter search |
| `<leader>zf` | Registers search |
| `<leader>zc` | Copilot Chat: select model |
| `F2` | Toggle file tree (NvimTree) |
| `F3` | Toggle Copilot Chat |
| `F4` | Toggle Undotree |
| `F5` | Toggle symbols outline |
| `<c-s>` | Save all buffers |
| `<c-j>` / `<c-l>` | Move line/selection down / up |
| `Y` | Yank to end of line |

### tmux
**`.tmux.conf`** — minimal config with vi bindings and clipboard integration.

### macOS
**`.amethyst.yml`** — [Amethyst](https://ianyh.com/amethyst/) tiling window manager config (symlinked on macOS only).

### Linux / Xmonad (`xmonad/`)
Xmonad WM + xmobar config. Requires: xmonad, xmobar, feh, dmenu, suckless st.

Start with `startx`.

## Color Schemes

- **`TheCakeIsALie.itermcolors`** — iTerm2 color scheme
- **`windows-terminal-color`** — Windows Terminal color scheme
