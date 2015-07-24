OLD_DOCUMENTS=$OLD_HOME/Documents
if old_present; then
  if [ -n "`ls $OLD_DOCUMENTS/* 2>/dev/null`" ]; then
    ask "move Documents" &&
      mv -nv $OLD_DOCUMENTS/* ~/Documents/
  fi
fi
