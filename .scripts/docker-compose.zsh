#!/bin/zsh

source $HOME/.config/.scripts/lib/handlers.zsh

exit_if_exists docker-compose
install docker-compose
exit_if_failed "Failed to install docker-compose"
