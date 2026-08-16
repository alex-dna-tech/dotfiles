DETECTED_OS = $(shell uname)
ifeq ($(DETECTED_OS), Darwin)
	FONT = "macos-font.conf"
else
	FONT = "linux-font.conf"
endif

CONF = $(HOME)/.config/kitty

$(HOME)/.config/kitty/kitty.conf: 
	mkdir -p $(HOME)/.config/kitty \
		&& ln -sf $(CURDIR)/kitty.conf $(CONF)/kitty.conf \
		&& ln -sf $(CURDIR)/$(FONT) $(CONF)/font.conf \
		&& ln -sf $(CURDIR)/theme.conf $(CONF)/theme.conf \

clean:
	rm -rf $(HOME)/.config/kitty
.PHONY: clean
