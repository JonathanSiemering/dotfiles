# Dotfiles Ansible Playbook

Replaces `install.sh` / `install-helper.sh` with an idempotent Ansible playbook.

## Prerequisites

```bash
pip install ansible        # or: pipx install ansible
ansible-galaxy collection install -r ansible/requirements.yml
```

## Run

```bash
# From the repo root (dotfiles/)
ansible-playbook ansible/playbook.yml
```

## Roles

| Role | Description |
|---|---|
| `packages` | Installs system packages via apt / pacman / brew |
| `neovim` | Downloads & extracts the latest Neovim release (Linux only) |
| `fzf` | Clones fzf and runs its install script |
| `spaceship` | Clones spaceship-prompt |
| `zsh-syntax-highlighting` | Clones zsh-syntax-highlighting |
| `symlinks` | Creates all dotfile symlinks, sets zsh as default shell |

## OS detection

Detection is automatic via `ansible_facts['os_family']`:

- `Debian` → apt (Ubuntu, Debian)
- `Archlinux` → pacman
- `Darwin` → Homebrew (macOS)
