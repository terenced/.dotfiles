DOTFILES := $(HOME)/.dotfiles
OS := $(shell bin/is-supported bin/is-macos macos linux)
PATH := $(DOTFILES)/bin:$(PATH)
STOW_FOLDERS := 'nvim starship tmux zsh'

all: $(OS)

macos: core-macos brew-packages link

brew:
	@bash is-executable brew || curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh | bash

linux: core-linux link

stow-macos: brew
	@bash is-executable stow || brew install stow

stow-linux: core-linux
	sudo apt-get -y install stow

env-setup: link post-install

post-install: link
	@bash -c "./bin/post-install"	

link: stow-$(OS)
	@bash -c "STOW_FOLDERS=$(STOW_FOLDERS) DOTFILES=$(DOTFILES) ./bin/link"

link-only:
	@bash -c "STOW_FOLDERS=$(STOW_FOLDERS) DOTFILES=$(DOTFILES) ./bin/link"

unlink: stow-$(OS)
	@bash -c "STOW_FOLDERS=$(STOW_FOLDERS) DOTFILES=$(DOTFILES) ./bin/unlink"

core-macos: brew

brew-packages: brew
	brew bundle --file=$(DOTFILES)/macos/Brewfile || true

core-linux:
	sudo apt-get update
	sudo apt-get upgrade -y
	sudo apt-get dist-upgrade -f
	sudo apt install zsh
	sudo apt install neovim
	sudo apt install kitty
	sudo apt install exa
	curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
	curl -sS https://starship.rs/install.sh | sh
