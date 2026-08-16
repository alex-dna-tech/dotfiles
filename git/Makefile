$(HOME)/.gitconfig $(HOME)/.gitignore:
	ln -sf $(CURDIR)/gitconfig  $(HOME)/.gitconfig && \
	ln -sf $(CURDIR)/gitignore  $(HOME)/.gitignore && \
	chmod 0664 $(HOME)/.gitconfig $(HOME)/.gitignore

.PHONY: clean
clean:
	rm $(HOME)/.gitconfig $(HOME)/.gitignore
