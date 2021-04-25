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
%F{red}$%f "

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
