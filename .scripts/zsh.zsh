#!/bin/bash

exists() {
  type $1 > /dev/null ;
  return $?
}

if exists "zsh" ; then
  exit 0
fi

if exists "apt" ; then
  sudo apt install zsh -y
  exit 0
fi

echo "zsh.zsh does not currently support your package manager, please update it to do so"
exit 1
