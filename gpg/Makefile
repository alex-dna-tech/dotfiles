$(HOME)/.gnupg/gpg.conf.test:
	cat << EOF > $(HOME)/.gnupg/gpg.conf.test \
		auto-key-retrieve \
		no-emit-version \
		Special char: $@ $< \
		EOF
