#!/bin/zsh

source $HOME/.config/.scripts/lib/handlers.zsh

exit_if_exists curl 

install curl
exit_if_failed "Failed to install curl"
