.DEFAULT: install

DETECTED_OS = $(shell uname)
ifeq ($(DETECTED_OS), Darwin)
	TARGET = $(HOME)/.bash_profile
else
	TARGET = $(HOME)/.bashrc
endif

LNK_PATH = $(HOME)/dotfiles/bash
SOURCE = source $(LNK_PATH)/aliases.sh
GREP_COUNT = $(shell grep -c "aliases.sh" $(TARGET))

.PHONY: install
install: clean
		echo $(SOURCE) >> $(TARGET)

.PHONY: clean
clean:
		[ $(GREP_COUNT) -ne 0 ] \
			&& grep -v "aliases.sh" $(TARGET) > tmp.bashrc~ \
			&& mv tmp.bashrc~ $(TARGET) || echo "Nothing to do"

.PHONY: debug
debug:
	bash -v | ${PAGER:-more}

