# lets define a script that outputs a vimscript file

# this will be our vim output file
CUSTOM="foo.vim"

# lets clean the file first
TMPOUT="$CUSTOM.new"
rm -fv "$TMPOUT"
touch "$TMPOUT"

desc "this is a global boolean variable"
validate 'bool'
default 'y'
ask foo "Should we foo?"

if is_true foo; then
  echo "let g:foo = 1"
else
  echo "let g:foo = 0"
fi >> "$TMPOUT"

# once all finished we can 'commit' the vim config file
mv -fv "$TMPOUT" "$CUSTOM"
