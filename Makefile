SUBDIRS = bash git nvim tmux
EXTRA = alacritty kitty minvim fabric docker

.PHONY: base
base: $(SUBDIRS)

.PHONY: i3wm
i3wm: base alacritty
	@$(MAKE) -C i3wm

.PHONY: dwm
dwm: base kitty
	@$(MAKE) -C dwm

.PHONY: $(SUBDIRS) $(EXTRA)
$(SUBDIRS) $(EXTRA):
	@$(MAKE) -C $@

