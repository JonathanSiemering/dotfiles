#!/bin/sh

# install fzf
fzf_dir=~/.local/fzf
if [ -d $fzf_dir ]; then
    cd $fzf_dir
    git pull
    cd $script_dir
else
    git clone --depth 1 https://github.com/junegunn/fzf.git $fzf_dir
fi
$fzf_dir/install --key-bindings --completion --no-update-rc

# install zsh plugins
zsh_syntax_highlighting_dir=~/.local/zsh/plugins/zsh-syntax-highlighting
if [ -d $zsh_syntax_highlighting_dir ]; then
    cd $zsh_syntax_highlighting_dir
    git pull
    cd $script_dir
else
    mkdir -p $zsh_syntax_highlighting_dir
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $zsh_syntax_highlighting_dir
fi
