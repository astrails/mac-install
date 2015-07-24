OLD_ROOT=~/2
OLD_HOME=~/2$HOME
function old_present() { [ -h $OLD_ROOT -a -e $OLD_ROOT ]; }

old_present || warn "Please link $OLD_ROOT to the old drive root"

function ask()
{
  echo
  echo -ne "${GREEN}${BOLD}$*?${NC} "
  read a

  [[ 'y' == "$a" || "Y" == "$a" ]]
}

function from_home()
{
  old_present || return # silently skip
  l
  local op="$1"; shift
  local d="$1"; shift

  if [ -e ~/"$d" ]; then
    i "~/$d already exists"
    return 1

  elif [ ! -e $OLD_HOME/"$d" ]; then
    w "$OLD_HOME/$d doesn't exist"
    return 1

  else
    ask "$op ~/$d from old homedir" &&
      (set -x; $op $OLD_HOME/"$d" ~/"$d")
    return 0
  fi
  l
}

function home_move() { from_home mv "$@" ; }
function home_copy() { from_home cp "$@" ; }

function _ln()
{
  if [ -e "$2" ]; then
    [ ! -h "$2" ] \
      && warn "'$2' is exists and is not a link" \
      || ln -sfn$V "$1" "$2"
  else
    ln -sfnv "$1" "$2" # creating link, always verbose
  fi
}
