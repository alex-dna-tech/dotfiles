# st - suckless terminal (patched build)
# Patches: scrollback, ligatures, anysize+altscreen
ST_GIT = /tmp/st-git
SRC = $(CURDIR)
ST_093 = 0.9.3
PREFIX = /usr/local
SUDO = $(shell command -v sudo >/dev/null 2>&1 && echo sudo || echo doas)

.PHONY: install
install: build

.PHONY: build
build: $(ST_GIT) $(PREFIX)/bin/st

$(ST_GIT):
	git clone --depth=1 https://git.suckless.org/st $(ST_GIT)
	cd $(ST_GIT) && git fetch --unshallow
	cd $(ST_GIT) && git checkout $(ST_093)

$(PREFIX)/bin/st: $(ST_GIT) $(SRC)/st-patches/st-scrollback-0.9.2.diff $(SRC)/st-patches/st-ligatures-scrollback-0.9.3.diff $(SRC)/st-patches/st-anysize-altscreen-0.9.3.diff $(SRC)/config.h
	cd $(ST_GIT) && (git apply --reverse --check $(SRC)/st-patches/st-scrollback-0.9.2.diff 2>/dev/null && echo "scrollback patch already applied" || git apply $(SRC)/st-patches/st-scrollback-0.9.2.diff)
	cd $(ST_GIT) && (git apply --reverse --check $(SRC)/st-patches/st-ligatures-scrollback-0.9.3.diff 2>/dev/null && echo "ligatures patch already applied" || git apply $(SRC)/st-patches/st-ligatures-scrollback-0.9.3.diff)
	cd $(ST_GIT) && (git apply --reverse --check $(SRC)/st-patches/st-anysize-altscreen-0.9.3.diff 2>/dev/null && echo "anysize-altscreen patch already applied" || git apply $(SRC)/st-patches/st-anysize-altscreen-0.9.3.diff)
	cp $(SRC)/config.h $(ST_GIT)/config.h
	cd $(ST_GIT) && $(SUDO) make clean install

.PHONY: clean
clean:
	$(SUDO) rm -rf $(ST_GIT) $(PREFIX)/bin/st
