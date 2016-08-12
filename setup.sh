#!/bin/bash

set -e

CWD=$(pwd)
dotfiles=".aliases .gitconfig .tmux-linux.conf .tmux-osx.conf .tmux.conf .vimrc .zshrc .config/xfce4/terminal/terminalrc"

mkdir -p $HOME/.config/xfce4/

for dotfile in $dotfiles; do
  if [ ! -f $HOME/$dotfile ]; then
    echo "Linking $dotfile"
    ln -s $CWD/$dotfile $HOME/$dotfile
  else
    echo "Exists! $dotfile"
  fi
done
