#!/bin/sh

# install packages
sudo apt update
sudo apt -y install zsh git curl

# set zsh as default shell
chsh -s $(which zsh)

# install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# install zsh plugins
mkdir -p ~/.local/zsh/plugins
cd ~/.local/zsh/plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
cd ~

# set dotfiles
cp -f .profile ~/
cp -f .zshrc ~/
