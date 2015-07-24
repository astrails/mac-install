NC='\033[0m'
BOLD='\033[1m'

BLACK='\033[30m'
RED='\033[31m'
GREEN='\033[32m'
YELLOW='\033[33m'
BLUE='\033[34m'
MAGENTA='\033[35m'
CYAN='\033[36m'
WHITE='\033[37m'


BG_RED='\033[41m'
BG_YELLOW='\033[43m'

function info() { echo -e "${BLUE}${BOLD}INFO:${NC}${BLUE} $@${NC}"; }
function warn() { echo -e "\n${BG_YELLOW}${BLACK}WARNING:${NC}${YELLOW}${BOLD} $@${NC}\n"; }
function error() { echo -e "\n${BG_RED}${BLACK}ERROR:${NC}${RED}${BOLD} $@${NC}\n\n"; }

function die() { error "$@"; exit 1; }

if [ '-v' = "$1" ]; then
  shift
  V=v
else
  V=
fi

function l() { [ -n "$V" ] && echo; }
function i() { [ -n "$V" ] && info "$@"; }
function w() { [ -n "$V" ] && warn "$@"; }
