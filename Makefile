SUBDIRS = bash git nvim tmux

.PHONY: base
base: $(SUBDIRS)

.PHONY: dwm
dwm: base kitty 

.PHONY: $(SUBDIRS)
$(SUBDIRS):
	@$(MAKE) -C $@

