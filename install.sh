#!/usr/bin/env bash

function command_exists() {
  command -v "$1" >/dev/null 2>&1
}

# check curl command is executable
if ! command_exists "curl"; then
  echo "curl is not found, please install curl first"
  exit 1
fi

# copy vimrc to user home directory
cp -i ./.vimrc ~/.vimrc

# install plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
