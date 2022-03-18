#!/bin/sh

# copy this file in seperate dir and uncomment what you need

# normal installation
cd dotfiles
git pull
cd ..

dotfiles/install.sh



# +++ Patches +++

# go
#cat dotfiles/patches/go.txt >> ~/.profile

# wls-go
#cat dotfiles/patches/wsl-go.txt >> ~/.profile

# wsl ssh agent
#cat dotfiles/patches/wsl-ssh-agent.txt >> ~/.profile

# wsl2 ssh agent
#cat dotfiles/patches/wsl2-ssh-agent.txt >> ~/.profile

# cdev
#cat dotfiles/patches/cdev.txt >> ~/.profile

# gpg tty
#cat dotfiles/patches/gpg-tty.txt >> ~/.profile

# ssh agent
#cat dotfiles/patches/ssh-agent.txt >> ~/.profile



# +++ Windows +++

# .ideavimrc for jetbrain vim emulator
#cp -f dotfiles/.ideavimrc ~/c/.ideavimrc

# .XCompose for wincompose
#cp -f dotfiles/.XCompose ~/c/.XCompose


 
# +++ neovim plugins +++

# wsl 
#cp -f dotfiles/nvim/plugin/wsl.vim ~/.config/nvim/plugin/wsl.vim

# go 
#cp -f dotfiles/nvim/plugin/go.vim ~/.config/nvim/plugin/go.vim

# ccls 
#cp -f dotfiles/nvim/plugin/ccls.vim ~/.config/nvim/plugin/ccls.vim

# csharp 
#cp -f dotfiles/nvim/plugin/csharp.vim ~/.config/nvim/plugin/csharp.vim
