DETECTED_OS = $(shell uname)
ifeq ($(DETECTED_OS), Darwin)
	FONT = "macos-font.conf"
else
	FONT = "linux-font.conf"
endif

$(HOME)/.config/kitty/kitty.conf: 
	ln -sf $(CURDIR)  $(HOME)/.config \
		&& ln -sf $(HOME)/.config/kitty/$(FONT) $(HOME)/.config/kitty/font.conf

clean:
	rm -rf $(HOME)/.config/kitty
.PHONY: clean
