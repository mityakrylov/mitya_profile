#!/usr/bin/env bash

################################################################################
# setup profile

mkdir -p ~/tmp
mkdir -p ~/bin

cp -f profile ~/.profile
touch $HOME/.profile_custom

################################################################################
# setup vim

./setup_vim.sh

################################################################################
# setup tmux

rm -rf ~/.tmux

# tmux.conf
cp -f tmux.conf ~/.tmux.conf

# plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
tmux source ~/.tmux.conf

# run prefix + I to install plugins

################################################################################
# setup git

cp -f gitconfig ~/.gitconfig

################################################################################
# setup pylint

cp -f pylintrc ~/.pylintrc

