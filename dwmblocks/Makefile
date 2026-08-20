# dwmblocks - status bar blocks for dwm
BLOCK_GIT = /tmp/dwmblocks-git
SRC = $(CURDIR)
PREFIX = /usr/local
SUDO = $(shell command -v sudo >/dev/null 2>&1 && echo sudo || echo doas)

.PHONY: install
install: build

.PHONY: build
build: $(BLOCK_GIT) $(PREFIX)/bin/dwmblocks

$(BLOCK_GIT):
	git clone --depth=1 https://github.com/torrinfail/dwmblocks $(BLOCK_GIT)

$(PREFIX)/bin/dwmblocks: $(BLOCK_GIT) $(SRC)/blocks.def.h
	cp $(SRC)/blocks.def.h $(BLOCK_GIT)/blocks.def.h
	cd $(BLOCK_GIT) && $(SUDO) make clean install

.PHONY: clean
clean:
	$(SUDO) rm -rf $(BLOCK_GIT) $(PREFIX)/bin/dwmblocks
