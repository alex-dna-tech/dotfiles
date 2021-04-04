.DEFAULT: install

LNK_PATH=${HOME}/.bash

ifeq ($(OS),Windows_NT)
    DETECTED_OS := Windows
else
    DETECTED_OS := $(shell uname)
endif

.PHONY: install
install: 
	ln -sf ${PWD} ${LNK_PATH}

	# echo "source ${LNK_PATH}/aliases.sh" >> ${HOME}/.bash_profile
	
