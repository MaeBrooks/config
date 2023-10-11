#!/bin/zsh

source $HOME/.config/.scripts/lib/handlers.zsh

exit_if_exists emacs
install libxpm-dev
install libjpeg-dev
install libgif-dev
install libtiff-dev
install libgnutls28-dev
install libncurses-dev

local version="29.1"
local folder="emacs-$version"
local tar_file="$folder.tar.xz"
local target_dir="$HOME/.apps/$folder"
local here=$PWD

function defer() {
  if [ $? -ne 0 ] ; then
    cd $here
    fail "$1" 1
  fi
}

if [ ! -e $tar_file ]; then
  wget "http://ftp.gnu.org/gnu/emacs/$tar_file"
  exit_if_failed "Failed to grab $tar_file from emacs servers"
fi

if [ ! -e $target_dir ] ; then
  tar -xvf $tar_file
  exit_if_failed "Failed to unzip $tar_file"

  sudo mkdir -p $HOME/.apps/
  exit_if_failed "Failed to create $HOME/.apps directory"

  sudo mv $folder $target_dir
  exit_if_failed "Failed to move emacs to $target_dir"
fi

echo "[MOVING TO $target_dir]"
cd $target_dir
defer "Failed to move to $target_dir"

./configure
defer "Failed configure step at $target_dir"

sudo make
defer "Failed make step at $target_dir"

sudo make install
defer "Failed install step at $target_dir"

# echo 'export PATH=$PATH:$HOME/.apps/$folder/bin' >> ~/.zshrc ;
