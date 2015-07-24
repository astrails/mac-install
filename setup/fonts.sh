FONTS=Library/Fonts
function font()
{
  local font="$(basename $1)"
  if [ ! -e "/$FONTS/$font" ]; then
    ask "install $font" &&
      wget "$1" -O "/$FONTS/$font"
  fi
}

font http://www.levien.com/type/myfonts/Inconsolata.otf
font https://gist.github.com/raw/1595572/Inconsolata-dz-Powerline.otf
font https://gist.github.com/raw/1595572/Menlo-Powerline.otf
font https://gist.github.com/raw/1595572/mensch-Powerline.otf

if old_present; then
  i "copying fonts"
  cp -n $OLD_HOME/$FONTS/* ~/$FONTS
fi
