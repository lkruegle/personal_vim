#!/bin/bash
rm ~/.vimrc
rm -rf ~/.vim_runtime
rm -rf ~/.vim
cp  copy_to_home/.vimrc ~/
cp -r copy_to_home/.vim_runtime ~/
cp -r copy_to_home/.vim ~/
