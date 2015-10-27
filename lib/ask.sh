function reset()
{
  DESC=
  DEFAULT=
  VALIDATE="bool"
}
reset

function desc()
{
  if [ -n "$1" ]; then
    DESC="$*"
  else
    DESC="`cat`"
  fi
}

function validate()
{
  VALIDATE="$*"
}

function default()
{
  DEFAULT="$1"
}

function _ask()
{
  echo -en "${GREEN}${1}"
  [ -n "$2" ] && echo -en " ${CYAN}[$2]"
  echo -en ": ${YELLOW}"
}

function _valid()
{
  case "$1" in
    bool*) echo "$2" | grep -qiE '^(y(es)?|no?)$' ;;
    num*)  echo "$2" | grep -qiE '^[0-9]+$' ;;
    word)  echo "$2" | grep -qiE '^[a-z]+$' ;;
    sym)   echo "$2" | grep -qiE '^[a-z0-9_]+$' ;;
    str*)  [ -n "$2" ] ;;
    any*)  true ;;

    *) die "unknown type $1" ;;
  esac
}

function _canonic()
{
  case "$1" in
    bool*)
      if echo "$2" | grep -qiE '^(y(es)?)$'; then
        echo y
      else
        echo n
      fi
      ;;
    *) echo "$2";;
  esac
}

function _save()
{
  local name="$1"
  local escaped_value=$(printf %q "$2")

  if [ -n "$DESC" ]; then
    echo "$DESC" | sed -e 's/^/# /' >> "$OUT"
  fi
  echo $name=$escaped_value >> "$OUT"
  echo >> "$OUT"

  eval $name=$escaped_value
}

function _val()
{
  eval "echo \$$1"
}

function ask()
{
  if [ -z "$OUT" ]; then
    error check your arguments order
    usage
  fi

  [ -n "$1" ] || raise "missing name"
  local name="$1"; shift

  echo

  if [ -n "$DESC" ]; then
    echo -e "${BOLD}${BLUE}$DESC"
  fi

  local a
  while true; do
    _ask "$*" "$DEFAULT"

    local v=$(_val "$name")

    if [ -z "$FORCE" -a -n "$v" ]; then
      # try to use previously defined value
      a="$v"
      echo "$a"
      # make sure its not used on next iteration, e.g. if its invalid
      unset "$name"
    else
      read a; [ -z "$a" ] && a="$DEFAULT"
    fi

    if _valid "$VALIDATE" "$a"; then
      _save "$name" "$(_canonic "$VALIDATE" "$a")"
      break
    else
      echo -e "${YELLOW}'$a' ${READ}is not a valid '${VALIDATE}'${NC}"
    fi
  done

  reset
}

# script helpers
function is_true()
{
  [ 'y' == $(_val "$1") ]
}
