#!/bin/bash

set -e

CWD=$(pwd)
dotfiles=".aliases .gitconfig .tmuxline.conf .tmux.conf .vimrc .zshrc .go-env.sh"

mkdir -p "$HOME/.config/xfce4/terminal"

for dotfile in $dotfiles; do
  if [ ! -f $HOME/$dotfile ]; then
    echo "Linking $dotfile"
    ln -s $CWD/$dotfile $HOME/$dotfile
  else
    echo "Exists! $dotfile"
  fi
done
