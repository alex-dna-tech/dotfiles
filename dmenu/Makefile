# dmenu - scripts symlinked to $(PREFIX)/bin/
SRC = $(CURDIR)
PREFIX = /usr/local
SUDO = $(shell command -v sudo >/dev/null 2>&1 && echo sudo || echo doas)

.PHONY: install
install: build

.PHONY: build
build: dmenu-scripts

.PHONY: dmenu-scripts
dmenu-scripts:
	@for f in $(SRC)/dmenu-scripts/*.sh; do \
		$(SUDO) ln -sf "$$f" $(PREFIX)/bin/$$(basename "$$f"); \
	done

.PHONY: clean
clean:
	@for f in $(SRC)/dmenu-scripts/*.sh; do \
		$(SUDO) rm -f $(PREFIX)/bin/$$(basename "$$f"); \
	done
