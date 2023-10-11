Scripts=./.scripts
Run=./.scripts

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

all: zsh \
	kitty \
	curl \
	wget \
	feh \
	i3 \
	ripgrep \
	neovim \
	node \
	rust \
	golang \
	lazygit \
	docker \
	docker-compose \
	fly \
	treesitter \
	emacs

zsh: $(Scripts)/zsh.zsh
	$(Run)/zsh.zsh

kitty: $(Scripts)/kitty.zsh
	$(Run)/kitty.zsh

curl: $(Scripts)/curl.zsh
	$(Run)/curl.zsh

wget: $(Scripts)/wget.zsh
	$(Run)/wget.zsh

feh: $(Scripts)/feh.zsh
	$(Run)/feh.zsh

i3: $(Scripts)/i3.zsh
	$(Run)/i3.zsh

ripgrep: $(Scripts)/ripgrep.zsh
	$(Run)/ripgrep.zsh

neovim: $(Scripts)/neovim.zsh
	$(Run)/neovim.zsh

node: $(Scripts)/node.zsh
	$(Run)/node.zsh

rust: $(Scripts)/rust.zsh
	$(Run)/rust.zsh

golang: $(Scripts)/golang.zsh
	$(Run)/golang.zsh

lazygit: golang $(Scripts)/lazygit.zsh
	$(Run)/lazygit.zsh

docker: $(Scripts)/docker.zsh
	$(Run)/docker.zsh

docker-compose: docker $(Scripts)/docker-compose.zsh
	$(Run)/docker-compose.zsh

fly: $(Scripts)/fly.zsh
	$(Run)/fly.zsh

terraform: $(Scripts)/terraform.zsh
	@echo "This script is broken"
	exit 1
	$(Run)/terraform.zsh

treesitter: $(Scripts)/treesitter.zsh
	$(Run)/treesitter.zsh

emacs: $(Scripts)/emacs.zsh
	$(Run)/emacs.zsh
