#!/bin/zsh

source $HOME/.config/.scripts/lib/handlers.zsh

exit_if_exists cargo

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
exit_if_failed "Failed to install rust"
