CURL := $(shell command -v curl 2> /dev/null)
STOW := $(shell command -v stow 2> /dev/null)
FD := $(shell command -v fd 2> /dev/null)
STOW_PACKAGES := $(shell find . -mindepth 1 -maxdepth 1 -type d -not -path '*/\.*' -exec basename -a -- {} \+ | paste -sd " ")

.PHONY: all

all:
ifndef STOW
	@printf "Installing GNU Stow...\n"
	sudo apt-get install stow
endif
	@printf "Stowing all packages...\n"
	stow $(STOW_PACKAGES)
	@printf "Done\n"
