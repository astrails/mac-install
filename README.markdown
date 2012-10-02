
# Installing Mac

## What and Why

This is a step by step guide which was written by me for myself mostly, with
the intent to use and update it whenever I install a new mac.

    Note: Those instructions were last applied on a fresh Mountain Lion MacBook Pro.

<a name=top></a>
## Contents

* [AppStore](#appstore)
* [3rd party](#3rdparty)
* [Keychains](#keychains)
* [Preview signatures](#preview)
* [iTunes Music](#itunes)
* [iPhoto Pictures](#iphoto)
* [Skype history transfer](#skype)
* [MySQL](#mysql)
* [Copy Files](#files)
* [Preferences](#preferences)
* [All Descktops Apps](#alldesktopapps)
* [Homebrew](#homebrew)
* [/etc git](#etc)
* [Postfix](#postfix)
* [ZSH](#zsh)
* [Fonts](#fonts)
* [Dot files](#dotfiles)
* [gitconfig](#gitconfig)
* [ssh](#ssh)
* [Dotvim](#dotvim)
* [RVM](#rvm)
* [Heroku](#heroku)
* [Nodejs](#nodejs)
* [POW](#pow)
* [Backblaze](#backblaze)
* [ScanSnap](#scansnap)

* [Copyright](#copy)


<a name=appstore></a>
## AppStore

Login into the AppStore, go to "Purchases" and download all relevant apps.

In particular make sure to install Xcode.

<a name=3rdparty></a>
## 3rd party


> NOTE: some apps that are not "properly" signed will not start unless you
> change Gatekeeper preferences. There is a *better* workaround though. Right
> click and select 'Open', this time you will have an additional optin to open
> it regardless of the Gatekeeper settings.

* [Dropbox](https://www.dropbox.com)
* [1Password](https://agilebits.com/onepassword)

  > IMPORTANT: Make sure Dropbox finished sync before you open your 1password keychain!

* [Google Chrome](http://www.google.com/chrome/)

  sign into your gmail account to sync prefs
  (you will need to create a new application specific password if you use 2-phase auth.)

  visit [http://www.google.com/ncr](http://www.google.com/ncr) in every browser
  you use so that Google will stop redirecting to the stupid local site.

* [Google Drive](https://drive.google.com/start)
* [Skype](http://skype.com)
* [LaunchBar 5](http://www.obdev.at/products/launchbar/index.html)
* [iTerm2](http://www.iterm2.com)

  in Settings/Terminal set 'Unlimited scrollback'
* [GitX](http://gitx.laullon.com)

  `Right-click -> open` to open it for the first time (its not signed)

  After that go to menu `GitX/Enable Terminal Usage...` to enable terminal `gitx` command.

* [GrowlNotify](http://growl.info/downloads)
* [CCMenu](http://ccmenu.sourceforge.net)
* [Adobe Air](http://get.adobe.com/air/)
* [HipChat](https://www.hipchat.com)
* [AppTrap](http://onnati.net/apptrap/)
* [Postgress.app](http://postgresapp.com)

  To create postgres user without a password like in 'regular' postgres installation:

        createuser --no-password -h localhost postgres
        echo /Applications/Postgres.app/Contents/MacOS/bin | sudo tee /etc/paths.d/postgres
* [SequelPro](http://www.sequelpro.com)
* [Transmission](http://www.transmissionbt.com)
* [VLC](http://www.videolan.org/)
* [Things](http://culturedcode.com/things/)

  configure 'ctrl-alt-cmd-n' as quick entry with autofill

* [Stanza](http://www.lexcycle.com)

  > Note: site seems to be down. copy from old computer's Applications folder
  > instead

* [Calibre](http://calibre-ebook.com)

  Choose ~/Dropbox/books as the library location

* [AppFresh](http://metaquark.de/appfresh/mac)

* [Evernote Web Clipper](https://evernote.com/webclipper/)

  Install Evernote from App Store first.

[top](#top)<a name=keychains></a>
## Keychains

Copy files from `~/Library/Keychains/`. rename them with some common prefix
like name of the old computer.

[top](#top)<a name=preview></a>
## Preview signatures

 Copy
 `~/Library/Containers/com.apple.Preview/Data/Library/Preferences/com.apple.Preview.signatures.plist`
 from the old computer.

 The keychains from the previous step should let you open it.

[top](#top)<a name=itunes></a>
## iTunes Music

* quit iTunes on the old computer.
* open home directory in Finder
* right click on the Music folder and 'compress' it
* transfer it to the new computer.
* unpack into some temp folder
* remove the **inside content** of your ~/Music folder
* move the content of the Music folder from the old computer into ~/Music
* in case your music library was on an external drive - make sure the drive is mounted
* start iTunes

[top](#top)<a name=iphoto></a>
## iPhoto Pictures

* simply copy the `~/Pictures/iPhoto Library` to the new computer

[top](#top)<a name=skype></a>
## Skype history transfer

* make sure you have the same version of Skype on both old and new computers
* quit Skype on both computers
* create archive of your skype id directory on the old computer, transfer it
  and open it at the same place at the new computer. The path is:
  
        ~/Library/Application Support/Skype/YOUR_SKYPE_ID

[top](#top)<a name=mysql></a>
## MySQL

* Download 64bit Community Server DMG archive from [MySQL](http://mysql.com).
* Mount it
* install 3 components:
  * mysql
  * MySQL.prefpane
  * MySQLStartupItem
* setup paths:

        echo /usr/local/mysql/bin | sudo tee /etc/paths.d/mysql
        echo /usr/local/mysql/man | sudo tee /etc/manpaths.d/mysql


[top](#top)<a name=files></a>
## Copy Files

Copy the following files over:

* `~/Documents/`
* `~/Downloads`
* `~/Desktop/`
* `~/bin/`

  add `~/bin` to the path:

        echo ~/bin | sudo tee /etc/paths.d/home-bin

[top](#top)<a name=preferences></a>
## Preferences

Go to system preferences and adjust the following:

* Dock

  check "Automatically hide and show the Dock"

* Mission Control

  uncheck "Automatically rearrange spaces based on most recent use"

  uncheck "When switching to an application, switch to a space with open windows for the application"

* Language & Text

  select required input sources

* Security & Privacy

  disable password reset through Apple ID

  turn on "File Vault"

  turn on Firewall

* Keyboard

  in "Modifier Keys" popup switch "Caps Lock" to "Control"

  * Keyboard Shortcuts:

    * turn off "Show Spotlight Window" in spotlight group and
    * turn on "Select next source in Input menu" in the "Keyboard & Text" group.
    * turn on "Switch to Desktop .." in "Mission Control"

    * turn on "All controls" for full keyboard access at the bottom of the
      dialog.


* Trackpad

  check "Tap to Click"

* Mail, Contacts & Calendars

  Setup GMail account

* Sharing

  Choose computer name

* Accessability

Enable dragging with Drag Lock on "Mouse & Trackpad/Trackpad Options"

[top](#top)<a name=alldesktopapps></a>
## All Descktops Apps

Change the following apps to be on all descktops:

* Preferences
* iTunes
* Contacts
* Calendar
* Reminders
* Skype
* HipChat
* 1Password
* Activity Monitor

[top](#top)<a name=homebrew></a>
## Homebrew

* Install Xcode command line tools from Xcode Preferences' Downloads tab.
* Install [Xquartz](http://xquartz.macosforge.org/) of at least version 2.7.2
  > NOTE: VERY important to install Xquartz before Homebrew.
* Install [Homebrew](http://mxcl.github.com/homebrew/).
* brew install macvim git wget imagemagick aria2 dos2unix watch tree pstree
* brew install tmux mtr iftop htop-osx gpg2 ctags
* brew install erlang
* brew install clojure clojure-contrib leiningen
* brew install md5deep ack s3cmd unrar
* brew install tig

[top](#top)<a name=etc></a>
## /etc git

    sudo su -
    cd /etc/
    git init
    chmod 700 .git
    git add .
    git commit -m initial

[top](#top)<a name=postfix></a>
## Postfix

> UPDATE: I just installed a new Air laptop and it had the directories in the
> main.cf file pointing to the old location, so there was no need to do any of
> this... To check do `grep data_directory /etc/postfix/main.cf`. IF it points
> to /Library/... then you might need to do the fixes below.

If you upgraded from Lion your Postfix config is most probably broken.
The upgrade changes /etc/postfix/main.cf to point to a new set of postfix
directories but leaves the old directories at their old place.

> Note: I expect ML upgrade process to be soon fixed to handle this so at some
> point in time those steps should become unnecessary

to verify the new directory locations:

    ls /Library/Server/Mail/Data/spool
    ls /Library/Server/Mail/Data/mta

check the old directory locations:

    ls /var/spool/postfix
    ls /var/lib/postfix

Lets move the directories to their new place (if needed):

    sudo mkdir -p /Library/Server/Mail/Data
    sudo mv /var/spool/postfix /Library/Server/Mail/Data/spool
    sudo mv /var/lib/postfix /Library/Server/Mail/Data/mta

Start the Postfix daemon

    sudo postfix set-permissions
    sudo postfix start

`set-permissions` might complain about missing man pages. the problem is that
the new `postfix-files` file has the man pages with `.gz` extension, but they
were not compressed during the upgrade.

To fix:

    d=/usr/share/man;grep manpage_directory /etc/postfix/postfix-files | cut -d/ -f2- | cut -d: -f1 | grep '\.gz$' | while read f; do echo $f;[ ! -e "$d/$f" -a -e "$d/${f%.gz}" ] && sudo gzip -9v "$d/${f%.gz}";done
    sudo postfix set-permissions

Then you also might have the following problem:

> postfix/postfix-script: warning: group or other writable: /Library/Server/Mail/Data/mta

To fix edit /etc/postfix/postfix-files:

    sudo vim /etc/postfix/postfix-files

find the line

    $data_directory:d:$mail_owner:-:770:uc

and change 770 to 750. then set-persmissions again and verify:

    sudo postfix set-permissions
    sudo postfix check

[top](#top)<a name=zsh></a>
## ZSH

    brew install zsh zsh-completions

    git clone git@github.com:astrails/dotzsh .zsh
    ln -sfn .zsh/zshrc .zshrc

    echo /usr/local/bin/zsh | sudo tee -a /etc/shells
    chsh -s /usr/local/bin/zsh

    # edit /etc/paths and move /usr/local/bin to the 1st line
    # also add /usr/local/sbin just as the 2nd line
    vim /etc/paths

[top](#top)<a name=inconsolata></a>
## [Fonts](#fonts)

- wget http://www.levien.com/type/myfonts/Inconsolata.otf -O /Library/Fonts/Inconsolata.otf
- wget https://gist.github.com/raw/1595572/Inconsolata-dz-Powerline.otf -O /Library/Fonts/Inconsolata-dz-Powerline.otf
- wget https://gist.github.com/raw/1595572/Menlo-Powerline.otf -O /Library/Fonts/Menlo-Powerline.otf
- wget https://gist.github.com/raw/1595572/mensch-Powerline.otf -O /Library/Fonts/mensch-Powerline.otf


[top](#top)<a name=dotfiles></a>
## Dot files

Fork http://github.com/astrails/dotfiles and make changes to suite your needs.
You must edit user-gitconfig.

Then:

    cd ~
    git clone YOUR_FORK_LOCATION .dot
    cd .dot
    make install

This will install the following:

* ~/.local-after.vim
* ~/.zsh/local
* /etc/gitconfig
* ~/.gitconfig

[top](#top)<a name=gitconfig></a>
### Gitconfig

Homebrew's git system file is not quite properly set. it points to version
install dir and not to /usr/local/etc. we will need to link it every git install/upgrade:

First note the path of the system gitconfig file:

    git config --system -l

Link to /etc (use the path from previous command). e.g.:

    sudo ln -sfn /etc/gitconfig /usr/local/Cellar/git/1.7.11.4/etc/gitconfig

Verify it works:

    git lga

> NOTE: you will need to link this file again each time you install a new
> version of git

[top](#top)<a name=ssh></a>
## SSH

Copy your `~/.ssh` directory over from the old system or backup.

## SSH (new system / user)

Generate ssh keys:

    ssh-keygen -t dsa

[top](#top)<a name=dotvim></a>
## Dotvim

    cd ~
    git clone https://github.com/astrails/dotvim.git .vim
    ln -sfn .vim/vimrc .vimrc

    cd .vim
    make install


[top](#top)<a name=rvm></a>
## RVM

    curl -L https://get.rvm.io | sudo bash -s stable

After the install go to Preferences and add your user to the rvm group. Logout
and re-login. now you are able to run rvm commands.

    brew install libksba

    rvm install ruby

    brew tap homebrew/dupes
    brew install apple-gcc42

    rvm install 1.9.2

    CFLAGS="-I/opt/X11/include" rvm install 1.8.7


[top](#top)<a name=heroku></a>
## Heroku

Copy `~/.heroku/accounts` from the old machine.

Then:

    gem install heroku
    heroku plugins:install git://github.com/ddollar/heroku-accounts.git

Verify by running

    heroku accounts

[top](#top)<a name=nodejs></a>
## Nodejs

We will use NVM to install node:

    cd ~
    git clone git://github.com/creationix/nvm.git .nvm

Open new terminal so that nvm config will load (handled by dotfiles/zsh-local).

Then:

    nvm install v0.8.6
    nvm alias default v0.8.6

Open new terminal again and verify that `node` works.

Now we need to install a couple of npm modules:

    npm install -g coffee-script
    npm install -g js2coffee

[top](#top)<a name=pow></a>
## POW

    curl get.pow.cx | sh

[top](#top)<a name=backblaze></a>
### Backblaze

Download and install Backblaze from [backblaze.com](http://backblaze.com/).

Start backblaze.

Select Transfer Backup State from the Backblaze Menu Icon and follow the steps.

[top](#top)<a name=scansnap></a>
## ScanSnap

- Download [ScanSnap Manager](http://scansnap.fujitsu.com/g-support/en/)
  
  Need to install original software and latest update.

[top](#top)<a name=copy></a>
## Copyright

© 2012 Vitaly Kushner, Astrails Ltd.