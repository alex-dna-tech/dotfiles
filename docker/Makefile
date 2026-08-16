SUDO = $(shell command -v sudo >/dev/null 2>&1 && echo sudo || echo doas)

install:
	$(SUDO) sh $(CURDIR)/get-docker.sh
.PHONY: install
