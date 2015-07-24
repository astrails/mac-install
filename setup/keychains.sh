KEYCHAINS="Library/Keychains"
for k in $OLD_HOME/$KEYCHAINS/*.keychain; do
  [ -e "$k" ] || continue
  f=~/$KEYCHAINS/"old_$(basename $k)"
  if [ -e "$f" ]; then
    if diff -q "$k" "$f" > /dev/null; then
      i already copied $k
    else
       w "keychains: $k and $f differ"
    fi
  else
    ask "copy keychain $k" &&
      cp -v "$k" "$f"
  fi
done
