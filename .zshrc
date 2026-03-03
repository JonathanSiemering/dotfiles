# Tap completation
autoload -Uz compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# Disable beep
unsetopt BEEP

# Read .profile
[[ -e ~/.profile ]] && emulate sh -c 'source ~/.profile'

# Prompt and color
autoload -U colors && colors
export PS1="
%F{cyan}%n%f @ %F{green}%m%f : %F{yellow}%~
%F{red}>%f "

# Edit line in editor with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# Use vim mode and set cursor shape
bindkey -v
export KEYTIMEOUT=1

function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[2 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[6 q'
  fi
}

zle -N zle-keymap-select
preexec() { echo -ne '\e[6 q' ;}

# Use fzf
export FZF_DEFAULT_OPTS="--layout=reverse --inline-info --height=40%"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Load zsh-syntax-highlighting; should be last.
source ~/.local/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Spaceship
[ -f ~/.local/spaceship/spaceship.zsh ] && source ~/.local/spaceship/spaceship.zsh

# Dotfiles update check (once per day)
function _dotfiles_update_check() {
    local dotfiles_dir="$HOME/.dotfiles/dotfiles"
    local stamp_file="${XDG_CACHE_HOME:-$HOME/.cache}/dotfiles_last_check"
    local now=$(date +%s)

    if [[ -f "$stamp_file" ]]; then
        local last=$(< "$stamp_file")
        (( now - last < 86400 )) && return
    fi

    echo "$now" > "$stamp_file"
    (
        git -C "$dotfiles_dir" fetch --quiet 2>/dev/null || exit
        local local_head=$(git -C "$dotfiles_dir" rev-parse HEAD 2>/dev/null)
        local remote_head=$(git -C "$dotfiles_dir" rev-parse '@{u}' 2>/dev/null)
        [[ -n "$remote_head" && "$local_head" != "$remote_head" ]] && \
            print -P "%F{yellow}dotfiles:%f updates available"
    ) &!
}

_dotfiles_update_check
