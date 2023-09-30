#!/bin/zsh

source $HOME/.config/.scripts/lib/handlers.zsh

exit_if_exists lazygit
exit_if_not_exists go 1 "Go not in path / not installed, unable to download lazygit"

go install github.com/jesseduffield/lazygit@latest

exit_if_not_exists lazygit 1 "go install failed at: '$target_dir', lazygit not installed"
