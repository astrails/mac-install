XCODESELECT := /usr/bin/xcode-select
ICONV := /usr/include/iconv.h
BREW := /usr/local/bin/brew

default: install link-vim

install: ${BREW}
	brew bundle install -v --no-upgrade

upgrade: ${BREW}
	brew bundle install -v

link-vim: /usr/local/bin/vim /usr/local/bin/vimdiff
/usr/local/bin/vim:
	ln -sfn nvim $@
/usr/local/bin/vimdiff:
	ln -sfn nvim $@

ifeq (,$(wildcard ${XCODESELECT}))
	$(error Please install XCODE)
endif

${ICONV}:
	@echo Installing XCODE command line tools
	${XCODESELECT} --install

${BREW}: ${ICONV}
	./install-brew.sh

.PHONY: install upgrade link-vim
