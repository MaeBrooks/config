#!/bin/zsh

source $HOME/.config/.scripts/lib/handlers.zsh

exit_if_exists i3
exit_if_not_exists git

local target="$HOME/.apps/i3"
local here=$PWD

function defer() {
  if [ $? -ne 0 ] ; then
    cd $here
    echo $1
    exit 1
  fi
}

if [ ! -d $target ]; then
  git clone https://github.com/i3/i3.git $target
  exit_if_failed "Failed to clone i3"
fi

cd $target
defer "Failed to move to $target"

make
defer "Failed setup"

sudo make install
defer "Failed to install i3"
