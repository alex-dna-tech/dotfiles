$(HOME)/.gitconfig: helper
	ln -sf $(PWD)/gitconfig  $(HOME)/.gitconfig && chmod 0664 $(HOME)/.gitconfig

.PHONY: helper
helper:
	git config credential.helper 'store' 

.PHONY: clean
clean:
	rm $(HOME)/.gitconfig
