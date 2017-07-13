# parse args
V=
while getopts fv opt; do
  case $opt in
    f) ASK_FORCE=1;;
    v)
      VERBOSE=1
      V=v
      ;;
    *) die
  esac
done
shift $((OPTIND-1))
