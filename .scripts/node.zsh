#!/bin/zsh

source $HOME/.config/.scripts/lib/handlers.zsh

exit_if_exists nvm
exit_if_exists node

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
exit_if_failed "Failed to install nvm"

concat 'export NVM_DIR="$HOME/.nvm"' ~/.zshrc && \
  concat '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"' ~/.zshrc && \
  concat '[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"' ~/.zshrc
exit_if_failed "Failed to concat to ~/.zshrc"

source ~/.zshrc
exit_if_failed "unable to source ~/.zshrc, forgoing node install"

nvm install --lts
exit_if_failed "unable to unstall most recent node version"
