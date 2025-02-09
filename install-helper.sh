#!/bin/sh

# specify os
# export DOTFILES_OS="ubuntu"
# export DOTFILES_OS="arch"
# export DOTFILES_OS="macos"

# export DOTFILES_ARCH="x86"
# export DOTFILES_ARCH="arm"

# normal installation
cd dotfiles
git pull
cd ..

dotfiles/install.sh
