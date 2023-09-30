#!/bin/zsh

source $HOME/.config/.scripts/lib/handlers.zsh

exit_if_exists rg
install ripgrep
exit_if_failed "Failed to install ripgrep"
