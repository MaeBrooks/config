#!/bin/zsh

source $HOME/.config/.scripts/lib/handlers.zsh

exit_if_exists wget

install wget
exit_if_failed "Failed to install wget"
