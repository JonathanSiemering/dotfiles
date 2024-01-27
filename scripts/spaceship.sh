#!/bin/sh

# install spaceship
spaceship_dir=~/.local/spaceship
if [ -d $spaceship_dir ]; then
    cd $spaceship_dir
    git pull
    cd $script_dir
else
    git clone --depth 1 https://github.com/spaceship-prompt/spaceship-prompt.git $spaceship_dir
fi

