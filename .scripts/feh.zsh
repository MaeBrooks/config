#!/bin/zsh

source $HOME/.config/.scripts/lib/handlers.zsh

exit_if_exists feh
install feh
exit_if_failed "Failed to install feh"
