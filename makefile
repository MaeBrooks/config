Script=./.scripts
export HOME=/home/debian

default: info checks all

info:
	@echo "Running setup scripts! This will install assuming HOME=$(HOME)"
	@echo ""

checks:
	$(Script)/check.bash

all: zsh curl wget feh i3 ripgrep neovim node rust golang lazygit

zsh: $(Script)/zsh.zsh
	$(Script)/zsh.zsh

kitty: $(Script)/kitty.zsh
	$(Script)/kitty.zsh

curl: $(Script)/curl.zsh
	$(Script)/curl.zsh

wget: $(Script)/wget.zsh
	$(Script)/wget.zsh

feh: $(Script)/feh.zsh
	$(Script)/feh.zsh

i3: $(Script)/i3.zsh
	$(Script)/i3.zsh

ripgrep: $(Script)/ripgrep.zsh
	$(Script)/ripgrep.zsh

neovim: $(Script)/neovim.zsh
	$(Script)/neovim.zsh

node: $(Script)/node.zsh
	$(Script)/node.zsh

rust: $(Script)/rust.zsh
	$(Script)/rust.zsh

golang: $(Script)/golang.zsh
	$(Script)/golang.zsh

lazygit: $(Script)/lazygit.zsh
	$(Script)/lazygit.zsh
