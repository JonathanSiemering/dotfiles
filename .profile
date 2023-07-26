
# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

if [ -e "$HOME/.profile-settings" ]; then
    . $HOME/.profile-settings
fi

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi

# set PATH
if [ -d "$HOME/bin" ] ; then
    PATH="$PATH:$HOME/bin"
fi

if [ -d "$HOME/.local/bin" ] ; then
    PATH="$PATH:$HOME/.local/bin"
fi

if [ -d "$HOME/.local/nvim/nvim-linux64/bin" ] ; then
    PATH="$PATH:$HOME/.local/nvim/nvim-linux64/bin"
fi

if [ -d "/usr/local/go/bin" ] ; then
    PATH="$PATH:/usr/local/go/bin"
fi

if [ -d "$HOME/go/bin" ] ; then
    PATH="$PATH:$HOME/go/bin"
fi

# exports
export EDITOR="nvim"
export LS_COLORS="di=36;40:fi=37;40:ln=33;40:ex=92;40:pi=95;40:so=95;40:ow=36;40"

# alias
alias vi=nvim

alias ls='ls --color'
alias l='ls -lah'
alias la='ls -lAh'
alias ll='ls -lh'
alias lsa='ls -lah'

alias se='sudoedit'

alias s='sudo '
alias ..='cd ..'
alias ~='cd ~'

alias lg='lazygit'

alias cddotfiles='cd ~/.dotfiles/dotfiles'
alias cdnvim='cd ~/.dotfiles/dotfiles/nvim'

# wsl2 ssh agent
if [[ "$SSH_AGENT" = "wsl2" ]]; then
    export SSH_AUTH_SOCK=$HOME/.ssh/agent.sock

    ss -a | grep -q $SSH_AUTH_SOCK
    if [ $? -ne 0   ]; then
        rm -f $SSH_AUTH_SOCK
        ( setsid socat UNIX-LISTEN:$SSH_AUTH_SOCK,fork EXEC:"$HOME/c/npiperelay/npiperelay.exe -ei -s //./pipe/openssh-ssh-agent",nofork & ) >/dev/null 2>&1
    fi
fi

# cdev alias
if [ -n "$CDEV_DIR" ]; then
    alias cdev="cd \"\$(find $CDEV_DIR -maxdepth 3 -type d | fzf)\""
fi

# gpg tty
if [ -n "$ACTIVATE_GPG" ]; then
    export GPG_TTY=$(tty)
fi
