Scripts=./.scripts
export HOME=/home/debian

default: info checks all

help:
	@echo "Before running make and thus setting up configs, and packages, please make sure that you alter the default 'export HOME=/home/debian'"
	@echo "At the top of the file"
	@echo ""
	@echo "How to run on most linux systems"
	@echo "sudo make"
	@echo ""

info:
	@echo "Running setup scripts! This will install assuming HOME=$(HOME)"
	@echo ""

checks:
	$(Scripts)/check.bash

all: zsh curl wget feh i3 ripgrep neovim node rust golang lazygit

zsh: $(Scripts)/zsh.zsh
	$(Scripts)/zsh.zsh

kitty: $(Scripts)/kitty.zsh
	$(Scripts)/kitty.zsh

curl: $(Scripts)/curl.zsh
	$(Scripts)/curl.zsh

wget: $(Scripts)/wget.zsh
	$(Scripts)/wget.zsh

feh: $(Scripts)/feh.zsh
	$(Scripts)/feh.zsh

i3: $(Scripts)/i3.zsh
	$(Scripts)/i3.zsh

ripgrep: $(Scripts)/ripgrep.zsh
	$(Scripts)/ripgrep.zsh

neovim: $(Scripts)/neovim.zsh
	$(Scripts)/neovim.zsh

node: $(Scripts)/node.zsh
	$(Scripts)/node.zsh

rust: $(Scripts)/rust.zsh
	$(Scripts)/rust.zsh

golang: $(Scripts)/golang.zsh
	$(Scripts)/golang.zsh

lazygit: $(Scripts)/lazygit.zsh
	$(Scripts)/lazygit.zsh
