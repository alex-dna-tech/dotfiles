.DEFAULT: install

LNK_PATH=$(HOME)/dotfiles/bash

ifeq ($(OS),Windows_NT)
    DETECTED_OS := Windows
else
    DETECTED_OS := $(shell uname)
endif

.PHONY: install
install: 
	[ "$(DETECTED_OS)" = "Darwin" ] \
		&& echo "source $(LNK_PATH)/aliases.sh" >> $(HOME)/.bash_profile \
		|| echo "source $(LNK_PATH)/aliases.sh" >> $(HOME)/.bashrc 
