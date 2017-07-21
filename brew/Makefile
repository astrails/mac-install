XCODESELECT := /usr/bin/xcode-select
ICONV := /usr/include/iconv.h
BREW := /usr/local/bin/brew

install: ${BREW}
	brew bundle install -v --no-upgrade

upgrade: ${BREW}
	brew bundle install -v

ifeq (,$(wildcard ${XCODESELECT}))
	$(error Please install XCODE)
endif

${ICONV}:
	@echo Installing XCODE command line tools
	${XCODESELECT} --install

${BREW}: ${ICONV}
	./install-brew.sh

.PHONY: install upgrade
