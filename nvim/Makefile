# TODO: create build from source target
NVIM = /usr/local/bin/nvim
DST_GIT = /tmp/neovim-git
SRC = $(HOME)/dotfiles/nvim
DST = $(HOME)/.config/nvim
LNK = ln -sf
OS = $(shell uname -s)
SUDO = $(shell command -v sudo >/dev/null 2>&1 && echo sudo || echo doas)

$(NVIM): install-dep $(DST) $(DST_GIT)
		cd $(DST_GIT) && make CMAKE_BUILD_TYPE=Release && \
		$(SUDO) make install

install-dep:
	if [ "$(OS)" = "Darwin" ]; then \
		brew install ninja cmake gettext curl; \
	elif [ -f /etc/alpine-release ]; then \
		$(SUDO) apk add ninja cmake gettext gettext-dev libtool g++ pkgconf unzip curl; \
	elif [ "$(OS)" = "Linux" ]; then \
		$(SUDO) apt -y install ninja-build gettext libtool-bin cmake g++ pkg-config unzip curl; \
	else \
		echo "Follow build instructions: https://github.com/neovim/neovim/blob/master/BUILD.md"; \
		exit 1; \
	fi
.PHONY: install-dep

$(DST):
	${LNK} ${SRC} ${DST}

$(DST_GIT):
	git clone --depth=1 https://github.com/neovim/neovim $(DST_GIT)

clean:
	rm -rf $(DST) $(HOME)/.cache/nvim $(DST_GIT)
.PHONY: clean

