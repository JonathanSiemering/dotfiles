# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# add nvim to path
PATH="$HOME/.nvim/nvim-linux64/bin:$PATH"

# exports
export EDITOR="vim"
export LS_COLORS="di=36;40:fi=37;40:ln=33;40:ex=92;40:pi=95;40:so=95;40:ow=36;40"

# alias
alias vi='nvim'
alias vim='nvim'

alias ls='ls --color'
alias l='ls -lah'
alias la='ls -lAh'
alias ll='ls -lh'
alias lsa='ls -lah'

alias e='edit'
alias se='sudoedit'

alias _='sudo '
alias ..='cd ..'
alias ~='cd ~'
