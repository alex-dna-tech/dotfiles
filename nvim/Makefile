# TODO: create build from source target
NVIM = /usr/local/bin/nvim
SRC = $(HOME)/dotfiles/nvim
DST = $(HOME)/.config/nvim
LNK = ln -sf

$(NVIM): install-dep $(DST) $(DST)/neovim-git
		cd $(DST)/neovim && make CMAKE_BUILD_TYPE=Release && \
		sudo make install

install-dep:
	sudo apt -y install ninja-build gettext libtool-bin cmake g++ pkg-config unzip curl
.PHONY: install-dep

$(DST):
	mkdir -p $(shell dirname ${DST}) && ${LNK} ${SRC} ${DST}

$(DST)/neovim-git:
	git clone https://github.com/neovim/neovim $(DST)/neovim-git


clean:
	rm -rf $(DST) $(HOME)/.cache/nvim
.PHONY: clean

