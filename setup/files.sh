OLD_DOCUMENTS=$OLD_HOME/Documents
if old_present; then
  if [ -n "`ls $OLD_DOCUMENTS/* 2>/dev/null`" ]; then
    ask "move Documents" &&
      mv -nv $OLD_DOCUMENTS/* ~/Documents/
  fi
fi

OLD_DESKTOP=$OLD_HOME/Desktop
if old_present; then
  if [ -n "`ls $OLD_DESKTOP/* 2>/dev/null`" ]; then
    ask "move Documents" &&
      mv -nv $OLD_DESKTOP/* ~/Desktop/
  fi
fi
