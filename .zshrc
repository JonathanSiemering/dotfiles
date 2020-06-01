# Tap completation
autoload -Uz compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

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

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Load zsh-syntax-highlighting; should be last.
source ~/.local/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh