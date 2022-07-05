SUBDIRS = bash nvim tmux

all: $(SUBDIRS)
$(SUBDIRS):
        $(MAKE) -C $@

.PHONY: all $(SUBDIRS)
