# TODO: create build from source target
NVIM = /usr/local/bin/nvim
DST_GIT = /tmp/neovim-git
SRC = $(HOME)/dotfiles/nvim
DST = $(HOME)/.config/nvim
LNK = ln -sf

$(NVIM): install-dep $(DST) $(DST_GIT)
		cd $(DST_GIT) && make CMAKE_BUILD_TYPE=Release && \
		sudo make install

install-dep:
	sudo apt -y install ninja-build gettext libtool-bin cmake g++ pkg-config unzip curl
.PHONY: install-dep

$(DST):
	${LNK} ${SRC} ${DST}

$(DST_GIT):
	git clone https://github.com/neovim/neovim $(DST_GIT)

clean:
	rm -rf $(DST) $(HOME)/.cache/nvim $(DST_GIT)
.PHONY: clean

