SRC = $(HOME)/dotfiles/nvim
DST = $(HOME)/.config/nvim
LNK = ln -sf

${DST}:
	mkdir -p $(shell dirname ${DST}) && ${LNK} ${SRC} ${DST}

	
.PHONY: clean
clean:
	rm -rf ${DST} $(HOME)/.cache/nvim
