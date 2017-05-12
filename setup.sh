#!/usr/bin/env bash

################################################################################
# setup profile

mkdir -p ~/tmp
mkdir -p ~/bin

cp -f .profile ~/.profile
touch $HOME/.profile_custom

################################################################################
# setup vim

rm -rf ~/.vim

# colors
mkdir -p ~/.vim/colors
git clone https://github.com/vim-scripts/wombat256.vim.git
cp -f wombat256.vim/colors/wombat256mod.vim ~/.vim/colors/
rm -rf wombat256.vim

# vimrc
cp -f .vimrc ~/.vimrc

# vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

################################################################################
# setup tmux


################################################################################
# setup git

