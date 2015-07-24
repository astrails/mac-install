if [ ! -e /usr/include/iconv.h ]; then
  ask "install xcode command line tools" &&
    xcode-select --install
fi

if [ -z "`which brew`" ]; then
  ask "install brew" &&
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
  i brew installed
fi

function brew_ensure()
{
  if [ ! -d /usr/local/Cellar/${2-$1} ]; then
    info "brew: $*"
    (set -x; brew install $*)
  else
    i brew: $1 already installed
  fi
}

function brew_install()
{
  for pkg in "$@"; do
    brew_ensure $pkg
  done
}

brew_install \
  aria2 ack ctags direnv pstree s3cmd \
  tig tmux tree unrar watch wget dos2unix \
  gettext imagemagick md5deep mtr git gnupg2 \
  htop-osx iftop

brew_ensure ag the_silver_searcher

brew_ensure "macvim --override-system-vim" macvim

brew_install zsh zsh-completions

brew_install docker docker-machine docker-swarm

brew_install erlang elixir

brew_install postgresql leiningen
