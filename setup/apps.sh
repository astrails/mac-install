function app()
{
  app="$1"; shift
  [ -e "/Applications/$app" ] && return

  ask "install $app" && open "$@"
}

app "Balsamiq Mockups 3.app" "https://balsamiq.com/download/"

app "Send to Kindle" "https://www.amazon.com/gp/sendtokindle"

app "Evernote.app" "https://www.evernote.com" "https://evernote.com/webclipper/"

app "Dropbox.app" "https://www.dropbox.com"
app "1Password 5.app" "https://agilebits.com/onepassword" "https://agilebits.com/onepassword/extensions"
app "Google Chrome.app" "http://www.google.com/chrome/"
app "Mailplane 3.app" "http://mailplaneapp.com"
app "Skype.app" "http:/b/skype.com"
app "Alfred 2.app" "http://www.alfredapp.com"
app "Bartender.app" "http://www.macbartender.com"
app "iTerm.app" "http://www.iterm2.com"
app "Slate.app" "https://github.com/jigish/slate"
app "VirtualBox.app" "https://www.virtualbox.org"
app "CCMenu.app" "http://ccmenu.sourceforge.net"
app "VLC.app" "http://www.videolan.org/"
app "Sonos.app" "http://www.sonos.com/support"
app "Sonos.app" "http://www.rdio.com"
app "Things.app" "http://culturedcode.com/things/"
app "Parrot Status.app" "http://vincent-le-normand.github.io/Parrot-Status/"
app "OpenOffice.app" "https://www.openoffice.org"
app "Backblaze.app" "http://backblaze.com/"

#app "Stanza.app" "http://www.lexcycle.com"
