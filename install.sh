#!/usr/bin/bash

# quick setup 
# require git to be installed before run this script


ln -sf ~/rcfiles/screenrc ~/.screenrc
ln -sf ~/rcfiles/bashrc ~/.bashrc
ln -sf ~/rcfiles/zshrc ~/.zshrc
ln -sf ~/rcfiles/tmux.conf ~/.tmux.conf

# Install ultimate vimrc
git clone git://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh

# Install Vundle
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
ln -sf ~/rcfiles/vimrc ~/.vimrc
vim +PluginInstall +qall
