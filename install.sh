#!/usr/bin/bash

# quick setup 
# require git to be installed before run this script

git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

ln -sf ~/rcfiles/screenrc ~/.screenrc
ln -sf ~/rcfiles/bashrc ~/.bashrc
ln -sf ~/rcfiles/vimrc ~/.vimrc
ln -sf ~/rcfiles/zshrc ~/.zshrc
ln -sf ~/rcfiles/tmux.conf ~/.tmux.conf

vim +BundleInstall +qall
