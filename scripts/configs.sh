#!/bin/sh

#config
mkdir -p ~/.config

# set zsh as default shell
chsh -s /bin/zsh

# mkdir .local
mkdir ~/.local


# nvim config
[ -d ~/.config/nvim ] && rm -r ~/.config/nvim
ln -s $script_dir/nvim ~/.config
touch $script_dir/nvim/update

# insert or replace dotfiles
[ -f ~/.profile ] && rm -r ~/.profile
ln -s $script_dir/.profile ~/.profile

[ -f ~/.zshrc ] && rm -r ~/.zshrc
ln -s $script_dir/.zshrc ~/.zshrc

[ -f ~/.vimrc ] && rm -r ~/.vimrc
ln -s $script_dir/.vimrc ~/.vimrc

[ -f ~/.tmux.conf ] && rm -r ~/.tmux.conf
ln -s $script_dir/.tmux.conf ~/.tmux.conf

# remove deprecated 
[ -d ~/.config/fish ] && rm -rf ~/.config/fish
[ -d ~/.nvim ] && rm -rf ~/.nvim
[ -d ~/.fzf ] && rm -rf ~/.fzf
