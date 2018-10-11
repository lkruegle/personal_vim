#!/bin/bash
for dir in `ls .vim/bundle/`; do
  cd ~/personal_vim/.vim/bundle/$dir;
  git submodule init;
  git submodule update;
done
cd ~/personal_vim

rm -rf ~/.vim*
cp -r .vim* ~/
