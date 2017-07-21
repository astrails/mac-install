help:
	@echo make brew
	@echo make link

brew:
	${MAKE} -C brew

link: ~/my
	./scripts/link-my-dirs.sh

dot: ~/.dot
	${MAKE} -C ~/.dot/ install


/etc/.git:
	cd /etc/;sudo git init;sudo git add .;sudo git commit -m initial
	sudo chmod 0700 /etc/.git

etc-git: /etc/.git

zsh:
	grep -q /usr/local/bin/zsh /etc/shells || echo /usr/local/bin/zsh | sudo tee -a /etc/shells
	chsh -s /usr/local/bin/zsh

~/.vim:
	mkdir $@

~/.vim/.config: ~/.vim vim-config
	cp vim-config $@

vim: ~/.vim/.config
	VIM_DIR=${HOME}/.vim ${MAKE} -C ~/my/config/dotvim2

.PHONY: brew link dot zsh vim
