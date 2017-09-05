help:
	@echo make brew
	@echo make link
	@echo make dot
	@echo make etc-git
	@echo make zsh
	@echo make vim
	@echo make ruby
	@echo make invoker
	@echo
	@echo OR
	@echo make all
.PHONY: help

all: brew link dot etc-git zsh vim ruby
.PHONY: all

brew:
	${MAKE} -C brew
.PHONY: brew

link: ~/my
	./scripts/link-my-dirs.sh
.PHONY: link

dot: ~/.dot
	${MAKE} -C ~/.dot/ install
.PHONY: dot

/etc/.git:
	cd /etc/;sudo git init;sudo git add .;sudo git commit -m initial
	sudo chmod 0700 /etc/.git

etc-git: /etc/.git
.PHONY: etc-git

zsh:
	grep -q /usr/local/bin/zsh /etc/shells || echo /usr/local/bin/zsh | sudo tee -a /etc/shells
	chsh -s /usr/local/bin/zsh
.PHONY: zsh

~/.vim:
	mkdir $@

~/.vim/.config: ~/.vim vim-config
	cp vim-config $@

vim: ~/.vim/.config
	VIM_DIR=${HOME}/.vim ${MAKE} -C ~/my/config/dotvim2

DEFAULT_RUBY ?= ruby-2.4
REXEC := chruby-exec ${DEFAULT_RUBY} --

RUBIES ?= ruby-2.1 ruby-2.2 ruby-2.3 ruby-2.4

ruby:
	for ruby in ${RUBIES}; do ruby-install --no-reinstall $$ruby; chruby-exec $$ruby -- gem install bundler; done
	echo ${DEFAULT_RUBY} > ~/.ruby-version
.PHONY: ruby

install-invoker:
	${REXEC} gem install invoker
.PHONY: install-invoker

invoker:
	sudo -E ${REXEC} invoker setup
.PHONY: invoker
