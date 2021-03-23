.DEFAULT: all

ifeq ($(OS),Windows_NT)
    DETECTED_OS := Windows
else
    DETECTED_OS := $(shell uname)
endif

DST = $(HOME)/.config/nvim
PLUG = $(HOME)/.vim/plugged/plug.vim
PLUG_URL = https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

MKDIR_P = mkdir -p
FOLDERS :=  plugin after/plugin lua

LNK = ln -sf
FILES := $(wildcard *.vim plugin/*.vim lua/*.lua)

all: dir install

.PHONY: dir
dir: $(addprefix ${DST}/,${FOLDERS})

$(addprefix ${DST}/,${FOLDERS}):
	${MKDIR_P} $@
	
.PHONY: install
install: $(addprefix ${DST}/,${FILES})
	[ -f ${PLUG} ] && exit 0 || curl -fLo ${PLUG} --create-dirs ${PLUG_URL}
	nvim +PlugInstall +GoInstallBinaries +qall

$(addprefix ${DST}/,${FILES}):
	${LNK} $(subst ${DST},$(CURDIR),$@) $@

.PHONY: clean
clean:
	rm -rf ${DST}
