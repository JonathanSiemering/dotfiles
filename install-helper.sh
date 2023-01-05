#!/bin/sh

# specify os
# export DOTFILES_OS = "ubuntu"
# export DOTFILES_OS = "arch"
# export DOTFILES_OS = "macos"

# normal installation
cd dotfiles
git pull
cd ..

dotfiles/install.sh
