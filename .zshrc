# Set up the prompt

autoload -Uz promptinit
promptinit
prompt adam1

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit
fpath=(~/.scripts $fpath);

alias vi="nvim"
alias ga="git add"
alias gco="git checkout"
alias ggp="git push --force"
alias ggl="git pull --all"
alias gfa="git fetch --all"
alias ls="/bin/ls --color=force"
alias cl="sbcl"
alias wifi="nmtui"

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

export PATH=$PATH:$HOME/.apps/nvim/bin
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$HOME/go/bin
export PATH=$PATH:$HOME/.nodenv/bin
export EDITOR="nvim"

function __set_up_ssh() {
  mkdir -p $HOME/.ssh

  if [ -n $SSH_AGENT_PID ] ; then
    if [ $? -ne 0 ] ; then
      eval $(ssh-agent -s)
      local public_ssh_files=$(ls -l "$HOME/.ssh" | grep "\.pub" | awk -F ' ' '{print $9}' | grep -v "^$" | awk -F '.pub' '{print $1}')

      for file in $public_ssh_files ; do
       ssh-add $file
      done
    fi
  fi
}
__set_up_ssh ;

export PATH="$HOME/.nodenv/bin:$PATH"
eval "$(nodenv init - zsh)"
[[ -s "$HOME/.kiex/scripts/kiex" ]] && source "$HOME/.kiex/scripts/kiex"
[[ -s "$HOME/.kiex/scripts/kiex" ]] && source "$HOME/.kiex/scripts/kiex"
[[ -s "$HOME/.kiex/scripts/kiex" ]] && source "$HOME/.kiex/scripts/kiex"
[[ -s "$HOME/.kiex/scripts/kiex" ]] && source "$HOME/.kiex/scripts/kiex"

export PATH="$HOME/.apps/odin:$PATH"

# opam configuration
[[ ! -r /home/zoft/.opam/opam-init/init.zsh ]] || source /home/zoft/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

[ -f "/home/zoft/.ghcup/env" ] && . "/home/zoft/.ghcup/env" # ghcup-env