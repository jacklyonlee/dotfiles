#!/bin/bash

# set current directory
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# download vim-plug
curl -fLo $DIR/vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# setup symlinks
ln -s $DIR/vim ~/.vim
ln -s $DIR/vimrc ~/.vimrc

# download vim plugins
vim +PlugInstall +PlugClean! +qall
