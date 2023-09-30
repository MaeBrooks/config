#!/bin/zsh

source $HOME/.config/.scripts/lib/handlers.zsh

exit_if_exists i3
install i3
exit_if_failed "Failed to install i3"
