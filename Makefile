SUBDIRS = bash git nvim tmux
EXTRA = alacritty kitty minvim fabric docker st dwmblocks dmenu

.PHONY: base
base: $(SUBDIRS)

.PHONY: i3wm
i3wm: base alacritty
	@$(MAKE) -C i3wm

.PHONY: dwm
dwm: base st dwmblocks dmenu
	@$(MAKE) -C dwm

.PHONY: $(SUBDIRS) $(EXTRA)
$(SUBDIRS) $(EXTRA):
	@$(MAKE) -C $@

