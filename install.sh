#!/usr/bin/env bash

function command_exists() {
  command -v "$1" >/dev/null 2>&1
}

# check curl command is executable
if ! command_exists "curl"; then
  echo "curl is not found, please install curl first"
  exit 1
fi


# download file form github
function use_github_install() {
  cp -i ./.vimrc ~/.vimrc
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
}

# download file from gitee
function use_gitee_install() {
  cp -i ./.gitee-vimrc ~/.vimrc
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://gitee.com/liaohui5/vim-plug/raw/master/plug.vim
  # gitee easymotion: https://gitee.com/liaohui5/vim-easymotion
}

echo -e "Which website do you want to use for download? \n 1:github \n 2:gitee"

read -r siteId

if [[ siteId -eq '1' ]]; then
  use_github_install
elif [[ siteId -eq '2' ]]; then
  use_gitee_install
else
    echo "only support github and gitee"
fi

echo "install successfully"
