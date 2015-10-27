# script file is just a bash script
# each variable name and value is available just after each 'ask' call, and can
# be tested / used freely
validate bool
default y
ask ask_next "ask the next question?"

if [ 'y' == $ask_next ];then
  validate any
  ask next "this is the next question"
fi

# or we can use the is_true helper
if is_true ask_next; then
  info "YES!!"
fi
