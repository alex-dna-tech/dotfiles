# dmenu - patched suckless build (case-insensitive, center, prefix-completion)
DMENU_BIN = /usr/local/bin/dmenu
DMENU_RUN = /usr/local/bin/dmenu_run
DST_GIT = /tmp/dmenu-git
SRC = $(CURDIR)
PREFIX = /usr/local
SUDO = $(shell command -v sudo >/dev/null 2>&1 && echo sudo || echo doas)

.PHONY: install
install: build

.PHONY: build
build: $(DST_GIT) $(DMENU_BIN) install-scripts

install-dep:
	@if [ -f /etc/alpine-release ]; then \
		$(SUDO) apk add libx11-dev libxft-dev libxinerama-dev harfbuzz-dev libxrender-dev gcc make; \
	elif [ "$(shell uname -s)" = "Linux" ]; then \
		$(SUDO) apt -y install libx11-dev libxft-dev libxinerama-dev libharfbuzz-dev libxrender-dev gcc make; \
	fi

# dmenu: suckless base + case-insensitive + center + prefix-completion
$(DMENU_BIN): $(DST_GIT) $(SRC)/dmenu.c $(SRC)/config.def.h
	cd $(DST_GIT) && git checkout -- .
	cp $(SRC)/dmenu.c $(DST_GIT)/dmenu.c
	cp $(SRC)/config.def.h $(DST_GIT)/config.def.h
	cd $(DST_GIT) && $(SUDO) make clean install
	$(SUDO) cp $(SRC)/dmenu-scripts/dmenu-nerd-glyphs.sh $(PREFIX)/bin/dmenu-nerd-glyphs
	$(SUDO) chmod 755 $(PREFIX)/bin/dmenu-nerd-glyphs

$(DST_GIT):
	git clone --depth=1 https://git.suckless.org/dmenu $(DST_GIT)
	cd $(DST_GIT) && git fetch --unshallow

.PHONY: install-scripts
install-scripts:
	@for f in $(SRC)/dmenu-scripts/*.sh; do \
		name=$$(basename "$$f" .sh); \
		$(SUDO) ln -sf "$$f" $(PREFIX)/bin/$$name; \
	done

.PHONY: clean
clean:
	$(SUDO) rm -rf $(DST_GIT)
	@for f in $(SRC)/dmenu-scripts/*.sh; do \
		name=$$(basename "$$f" .sh); \
		$(SUDO) rm -f $(PREFIX)/bin/$$name; \
	done
