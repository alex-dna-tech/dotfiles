$(HOME)/.gitconfig: helper
	ln -sf $(PWD)/gitconfig  $(HOME)/.gitconfig && \
	ln -sf $(PWD)/gitignore  $(HOME)/.gitignore && \
	chmod 0664 $(HOME)/.gitconfig $(HOME)/.gitignore

.PHONY: helper
helper:
	git config credential.helper 'store'


.PHONY: clean
clean:
	rm $(HOME)/.gitconfig $(HOME)/.gitignore 
