$(HOME)/.config/i3:
	mkdir -p $(HOME)/.config && \
	ln -sf $(PWD)/i3  $(HOME)/.config/i3

.PHONY: clean
clean:
	sudo rm -rf $(HOME)/.config/i3

.PHONY: install
install:
	sudo apt update && sudo apt install -y \
		i3 x11-xserver-utils rofi polybar compton xfce4-power-manager xfce4-appfinder \
		thunar variety conky feh xclip scrot vlc xsel dex
