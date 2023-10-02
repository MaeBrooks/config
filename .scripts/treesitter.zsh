#!/bin/zsh

source $HOME/.config/.scripts/lib/handlers.zsh

exit_if_not_exists git
[ -e "/usr/local/include/tree_sitter" ] && exit 0

local target_dir="$HOME/.apps/tree-sitter"
local here="$PWD"

function defer_if_failed() {
  if [ $? -ne 0 ] ; then
    cd $here
    echo "$1"
    exit 1  
  fi
}

mkdir -p $HOME/.apps
exit_if_failed "Failed to create $HOME/.apps/"

git clone https://github.com/tree-sitter/tree-sitter.git $target_dir
defer_if_failed "Failed to clone tree-sitter to $target_dir"

cd $target_dir
defer_if_failed "Failed to move to $target_dir"

sudo make
defer_if_failed "Failed to build tree-sitter"

sudo make install
defer_if_failed "Failed to install tree-sitter"
