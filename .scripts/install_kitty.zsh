#!/bin/zsh

source ~/.config/.scripts/lib/handlers.zsh

exit_if_exists kitty;

try $(curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin) "Failed to grab and execute kitty installer"

