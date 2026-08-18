# dwm - dynamic window manager (patched gruvbox build)
# Base: git.suckless.org/dwm pinned to 6.5, gruvbox patches overlaid,
# status bar: torrinfail/dwmblocks, terminal: st with ligatures.
DWM = /usr/local/bin/dwm
DST_GIT = /tmp/dwm-git
BLOCK_GIT = /tmp/dwmblocks-git
ST_GIT = /tmp/st-git
PATCH = $(SRC)/gruvbox.patch
SRC = $(CURDIR)
PREFIX = /usr/local
CONFIG = $(HOME)/.config
OS = $(shell uname -s)
SUDO = $(shell command -v sudo >/dev/null 2>&1 && echo sudo || echo doas)
# gruvbox fork is based on dwm 6.5 ("bump version to 6.5" commit)
DWM_65 = 061e9fe
ST_093 = 0.9.3

.PHONY: install
install:
	@if [ "$(OS)" = "Linux" ]; then \
		$(MAKE) build; \
	else \
		echo "dwm: Linux/X11 only, skipping"; \
	fi

.PHONY: build
build: install-dep $(DST_GIT) $(BLOCK_GIT) $(ST_GIT) $(DWM) $(PREFIX)/bin/dwmblocks $(PREFIX)/bin/st $(CONFIG)/picom/picom.conf $(CONFIG)/dunst/dunstrc dmenu-scripts

install-dep:
	@if [ -f /etc/alpine-release ]; then \
		$(SUDO) apk add libx11-dev libxft-dev libxinerama-dev harfbuzz-dev libxrender-dev gcc make feh xsetroot xrandr picom xprop xmodmap xclip xrdb curl font-fira-code-nerd flameshot dmenu rofi mpv dunst; \
	elif [ "$(OS)" = "Linux" ]; then \
		$(SUDO) apt -y install libx11-dev libxft-dev libxinerama-dev libharfbuzz-dev libxrender-dev gcc make feh x11-xserver-utils curl font-fira-code-nerd flameshot picom dmenu; \
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

# st: suckless terminal with scrollback + ligatures + anysize
$(PREFIX)/bin/st: $(ST_GIT) $(SRC)/st-patches/st-scrollback-0.9.2.diff $(SRC)/st-patches/st-ligatures-scrollback-0.9.3.diff $(SRC)/st-patches/st-anysize-altscreen-0.9.3.diff $(SRC)/st/config.h
	cd $(ST_GIT) && (git apply --reverse --check $(SRC)/st-patches/st-scrollback-0.9.2.diff 2>/dev/null && echo "scrollback patch already applied" || git apply $(SRC)/st-patches/st-scrollback-0.9.2.diff)
	cd $(ST_GIT) && (git apply --reverse --check $(SRC)/st-patches/st-ligatures-scrollback-0.9.3.diff 2>/dev/null && echo "ligatures patch already applied" || git apply $(SRC)/st-patches/st-ligatures-scrollback-0.9.3.diff)
	cd $(ST_GIT) && (git apply --reverse --check $(SRC)/st-patches/st-anysize-altscreen-0.9.3.diff 2>/dev/null && echo "anysize-altscreen patch already applied" || git apply $(SRC)/st-patches/st-anysize-altscreen-0.9.3.diff)
	cp $(SRC)/st/config.h $(ST_GIT)/config.h
	cd $(ST_GIT) && $(SUDO) make clean install

$(DST_GIT):
	git clone --depth=1 https://git.suckless.org/dwm $(DST_GIT)
	cd $(DST_GIT) && git fetch --unshallow
	cd $(DST_GIT) && git checkout $(DWM_65)

$(BLOCK_GIT):
	git clone --depth=1 https://github.com/torrinfail/dwmblocks $(BLOCK_GIT)

$(ST_GIT):
	git clone --depth=1 https://git.suckless.org/st $(ST_GIT)
	cd $(ST_GIT) && git fetch --unshallow
	cd $(ST_GIT) && git checkout $(ST_093)

$(CONFIG)/picom/picom.conf:
	mkdir -p $(CONFIG)/picom
	ln -s $(CURDIR)/picom.conf $(CONFIG)/picom/picom.conf

$(CONFIG)/dunst/dunstrc:
	mkdir -p $(CONFIG)/dunst
	ln -s $(CURDIR)/dunstrc.conf $(CONFIG)/dunst/dunstrc

# dmenu scripts: symlink each script in dmenu-scripts/ into $(PREFIX)/bin/
dmenu-scripts:
	@for f in $(SRC)/dmenu-scripts/*.sh; do \
		ln -sf "$$f" $(PREFIX)/bin/$$(basename "$$f"); \
	done

.PHONY: clean
clean:
	$(SUDO) rm -rf $(DST_GIT) $(BLOCK_GIT) $(ST_GIT) $(PREFIX)/bin/dwmblocks $(PREFIX)/bin/st $(CONFIG)/picom/picom.conf $(CONFIG)/dunst/dunstrc; \
	for f in $(SRC)/dmenu-scripts/*.sh; do \
		rm -f $(PREFIX)/bin/$$(basename "$$f"); \
	done
