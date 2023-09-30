#!/bin/zsh

source $HOME/.config/.scripts/lib/handlers.zsh

exit_if_exists kitty;

curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
exit_if_failed "Failed to grab and execute kitty installer"

