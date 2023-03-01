SUBDIRS = bash git nvim tmux kitty i3wm

.PHONY: all
all: $(SUBDIRS)

.PHONY: $(SUBDIRS)
$(SUBDIRS):
	@$(MAKE) -C $@

