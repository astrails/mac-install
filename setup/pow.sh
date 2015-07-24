if [ ! -d ~/"Library/Application Support/Pow/Hosts" ]; then
  ask "install pow" &&
    (set -x; curl get.pow.cx | sh)
fi

POW="Library/Application Support/Pow/Hosts"
home_move "$POW"
_ln "$POW" ~/.pow
