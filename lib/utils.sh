function l() { [ -n "$V" ] && echo "$@" || true ; }
function i() { [ -n "$V" ] && info "$@" || true ; }
function w() { [ -n "$V" ] && warn "$@" || true ; }

# _ln FROM TO
function _ln()
{
  yellow
  if [ -e "$2" ]; then
    [ ! -h "$2" ] \
      && warn "'$2' is exists and is not a link" \
      || ln -sfn$V "$1" "$2"
  else
    # creating link, always verbose
    ln -sfnv "$1" "$2"
  fi
  nc
}
