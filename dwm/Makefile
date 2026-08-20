# dwm - dynamic window manager (patched build)
DWM = /usr/local/bin/dwm
DST_GIT = /tmp/dwm-git
SRC = $(CURDIR)
PREFIX = /usr/local
CONFIG = $(HOME)/.config
OS = $(shell uname -s)
SUDO = $(shell command -v sudo >/dev/null 2>&1 && echo sudo || echo doas)

.PHONY: install
install:
	@if [ "$(OS)" = "Linux" ]; then \
		$(MAKE) build; \
	else \
		echo "dwm: Linux/X11 only, skipping"; \
	fi

.PHONY: build
build: install-dep $(DST_GIT) $(DWM) $(CONFIG)/picom/picom.conf $(CONFIG)/dunst/dunstrc

install-dep:
	@if [ -f /etc/alpine-release ]; then \
		$(SUDO) apk add libx11-dev libxft-dev libxinerama-dev harfbuzz-dev libxrender-dev gcc make feh xsetroot xrandr picom xprop xmodmap xclip xrdb curl jq font-fira-code-nerd font-noto-emoji flameshot mpv dunst; \
	elif [ "$(OS)" = "Linux" ]; then \
		$(SUDO) apt -y install libx11-dev libxft-dev libxinerama-dev libharfbuzz-dev libxrender-dev gcc make feh x11-xserver-utils curl jq font-fira-code-nerd font-noto-emoji flameshot picom ; \
	else \
		echo "Follow build instructions: https://github.com/Andrey0189/dwm-gruvbox"; \
		exit 1; \
	fi
.PHONY: install-dep

# dwm: suckless base + fullgaps + local config.h
$(DWM): $(DST_GIT) $(SRC)/config.h $(SRC)/dwm.c
	cd $(DST_GIT) && git checkout -- .
	cp $(SRC)/dwm.c $(DST_GIT)/dwm.c
	cp $(SRC)/config.h $(DST_GIT)/config.h
	cd $(DST_GIT) && $(SUDO) make clean install
	$(SUDO) cp $(SRC)/startdwm.sh $(PREFIX)/bin/startdwm.sh
	$(SUDO) chmod 755 $(PREFIX)/bin/startdwm.sh
	$(SUDO) cp $(SRC)/dwm.desktop $(PREFIX)/share/xsessions/dwm.desktop

$(DST_GIT):
	git clone --depth=1 https://git.suckless.org/dwm $(DST_GIT)
	cd $(DST_GIT) && git fetch --unshallow

$(CONFIG)/picom/picom.conf:
	mkdir -p $(CONFIG)/picom
	ln -s $(CURDIR)/picom.conf $(CONFIG)/picom/picom.conf

$(CONFIG)/dunst/dunstrc:
	mkdir -p $(CONFIG)/dunst
	ln -s $(CURDIR)/dunstrc.conf $(CONFIG)/dunst/dunstrc

.PHONY: clean
clean:
	$(SUDO) rm -rf $(DST_GIT) $(CONFIG)/picom/picom.conf $(CONFIG)/dunst/dunstrc
