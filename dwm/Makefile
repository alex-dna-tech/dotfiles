# dwm - dynamic window manager (patched gruvbox build)
# Base: git.suckless.org/dwm pinned to 6.5, gruvbox patches overlaid,
# status bar: torrinfail/dwmblocks.
DWM = /usr/local/bin/dwm
DST_GIT = /tmp/dwm-git
BLOCK_GIT = /tmp/dwmblocks-git
PATCH = $(SRC)/gruvbox.patch
SRC = $(CURDIR)
PREFIX = /usr/local
CONFIG = $(HOME)/.config
OS = $(shell uname -s)
SUDO = $(shell command -v sudo >/dev/null 2>&1 && echo sudo || echo doas)
# gruvbox fork is based on dwm 6.5 ("bump version to 6.5" commit)
DWM_65 = 061e9fe

.PHONY: install
install:
	@if [ "$(OS)" = "Linux" ]; then \
		$(MAKE) build; \
	else \
		echo "dwm: Linux/X11 only, skipping"; \
	fi

.PHONY: build
build: install-dep $(DST_GIT) $(BLOCK_GIT) $(DWM) $(PREFIX)/bin/dwmblocks $(CONFIG)/picom/picom.conf $(CONFIG)/dunst/dunstrc $(HOME)/.Xresources

install-dep:
	@if [ -f /etc/alpine-release ]; then \
		$(SUDO) apk add libx11-dev libxft-dev libxinerama-dev gcc make feh xsetroot xrandr picom xprop xmodmap xclip xrdb curl font-fira-code-nerd flameshot kitty kitty-terminfo dmenu rofi mpv dunst; \
	elif [ "$(OS)" = "Linux" ]; then \
		$(SUDO) apt -y install libx11-dev libxft-dev libxinerama-dev gcc make feh x11-xserver-utils curl font-fira-code-nerd flameshot kitty kitty-terminfo dmenu; \
	else \
		echo "Follow build instructions: https://github.com/Andrey0189/dwm-gruvbox"; \
		exit 1; \
	fi
.PHONY: install-dep

# dwm: suckless 6.5 base + gruvbox.patch + local config.h
$(DWM): $(DST_GIT) $(PATCH) $(SRC)/config.h
	cd $(DST_GIT) && (git apply --reverse --check $(PATCH) 2>/dev/null && echo "gruvbox.patch already applied" || git apply $(PATCH))
	cp $(SRC)/config.h $(DST_GIT)/config.h
	cd $(DST_GIT) && $(SUDO) make clean install
	$(SUDO) cp $(SRC)/startdwm.sh $(PREFIX)/bin/startdwm.sh
	$(SUDO) chmod 755 $(PREFIX)/bin/startdwm.sh
	$(SUDO) cp $(SRC)/dwm.desktop $(PREFIX)/share/xsessions/dwm.desktop

# dwmblocks: torrinfail/dwmblocks with local blocks config
$(PREFIX)/bin/dwmblocks: $(BLOCK_GIT) $(SRC)/blocks.def.h
	cp $(SRC)/blocks.def.h $(BLOCK_GIT)/blocks.def.h
	cd $(BLOCK_GIT) && $(SUDO) make clean install

$(DST_GIT):
	git clone --depth=1 https://git.suckless.org/dwm $(DST_GIT)
	cd $(DST_GIT) && git fetch --unshallow
	cd $(DST_GIT) && git checkout $(DWM_65)

$(BLOCK_GIT):
	git clone --depth=1 https://github.com/torrinfail/dwmblocks $(BLOCK_GIT)

$(CONFIG)/picom/picom.conf:
	mkdir -p $(CONFIG)/picom
	ln -s $(CURDIR)/picom.conf $(CONFIG)/picom/picom.conf

$(CONFIG)/dunst/dunstrc:
	mkdir -p $(CONFIG)/dunst
	ln -s $(CURDIR)/dunstrc.conf $(CONFIG)/dunst/dunstrc

$(HOME)/.Xresources:
	ln -s $(CURDIR)/Xresources.conf $(HOME)/.Xresources

.PHONY: clean
clean:
	$(SUDO) rm -rf $(DST_GIT) $(BLOCK_GIT) $(PREFIX)/bin/dwmblocks $(CONFIG)/picom/picom.conf $(CONFIG)/dunst/dunstrc $(HOME)/.Xresources
