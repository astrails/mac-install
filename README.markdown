
# Installing Mac

## What and Why

This is a step by step guide which was written by me for myself mostly, with
the intent to use and update it whenever I install a new mac.

    Note: Those instructions were last applied on a fresh Mountain Lion BacBook Pro.

<a name=top></a>
## Contents

* [Basic Setup](#basic)
  * [AppStore](#appstore)
  * [3rd party](#3rdparty)
  * [Preferences](#preferences)
  * [Homebrew](#homebrew)
  * [/etc git](#etc)
  * [ZSH](#zsh)
  * [Dot files](#dotfiles)
  * [ssh](#ssh)
  * [Dotvim](#dotvim)
  * [RVM](#rvm)

* [Copyright](#copy)


[top](#top)<a name=basic></a>
## Basic Setup

<a name=appstore></a>
### AppStore

Login into the AppStore, go to "Purchases" and download all relevant apps.

In particular make sure to install Xcode.

<a name=3rdparty></a>
### 3rd party

* [Dropbox](https://www.dropbox.com)
* [1Password](https://agilebits.com/onepassword)

  Make sure Dropbox finished sync before you open your 1password keychain!

* [Google Chrome](http://www.google.com/chrome/)
* [Skype](http://skype.com)
* [LaunchBar 5](http://www.obdev.at/products/launchbar/index.html)
* [iTerm2](http://www.iterm2.com)
* [Adobe Air](http://get.adobe.com/air/)
* [HipChat](https://www.hipchat.com)
* [AppTrap](http://onnati.net/apptrap/)
* [Postgress.app](http://postgresapp.com)
* [SequelPro](http://www.sequelpro.com)

  To install right click on it and select 'Open'. It wont start directly due to
  Gatekeeper.

  Start it and check "Start automatically on login"

* [AppFresh](http://metaquark.de/appfresh/mac)


[top](#top)<a name=preferences></a>
### Preferences

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

  in Keyboard Shortcuts turn off "Show Spotlight Window" in spotlight group and
  turn on "Select next source in Input menu" in the "Keyboard & Text" group.

* Trackpad

  check "Tap to Click"

* Mail, Contacts & Calendars

  Setup GMail account

* Sharing

  Choose computer name

* Accessability

Enable dragging with Drag Lock on "Mouse & Trackpad/Trackpad Options"

[top](#top)<a name=homebrew></a>
### Homebrew

* Install Xcode command line tools from Xcode Preferences' Downloads tab.
* Install [Xquartz](http://xquartz.macosforge.org/) of at least version 2.7.2
* Install [Homebrew](http://mxcl.github.com/homebrew/).
* brew install macvim git wget imagemagick aria2

[top](#top)<a name=etc></a>
### /etc git

    sudo su -
    cd /etc/
    git init
    chmod 700 .git
    git add .
    git commit -m initial

[top](#top)<a name=zsh></a>
### ZSH

    brew install zsh zsh-completions

    git clone git@github.com:astrails/dotzsh .zsh
    ln -sfn .zsh/zshrc .zshrc

    echo /usr/local/bin/zsh | sudo tee -a /etc/shells
    chsh -s /usr/local/bin/zsh

    # edit /etc/paths and move /usr/local/bin to the 1st line
    vim /etc/paths

[top](#dotfiles)<a name=dotfiles></a>
### Dot files

    cd ~
    git clone git@github.com:astrails/dotfiles .dot
    cd .dot
    sudo ln -sfn `pwd`/gitconfig /etc/gitconfig

    ln -sfn `pwd`/zsh-local ~/.zsh/local

#### Gitconfig

Homebrew's git system file is not quite properly set. it points to version
install dir and not to /usr/local/etc. we will need to link it every git install/upgrade:

First note the path of the system gitconfig file:

    git config --system -l

Link to /etc (use the path from previous command). e.g.:

    sudo ln -sfn /etc/gitconfig /usr/local/Cellar/git/1.7.11.4/etc/gitconfig

Verify it works:

    git lga

Global user's config:

    git config --global --add user.name "NAME"
    git config --global --add user.email "EMAIL"
    git config --global --add github.user "USER"
    git config --global --add heroku.account "ACCOUNT"

    git config --global -l

[top](#top)<a name=ssh></a>
### SSH

Copy your `~/.ssh` directory over from the old system or backup.

### SSH (new system / user)

Generate ssh keys:

    ssh-keygen -t dsa

[top](#top)<a name=dotvim></a>
### Dotvim

    cd ~
    git clone git@github.com/astrails/dotvim .vim
    ln -sfn .vim/vimrc vimrc

    cat > .local.vim
    set cul
    set foldcolumn=4

    if has('gui_running')
      set background=dark
      colorscheme=vividchalk
    else
      set background=light
    end
    ^D

    cd .vim
    make install


[top](#top)<a name=rvm></a>
### RVM

    curl -L https://get.rvm.io | sudo bash -s stable

After the install go to Preferences and add your user to the rvm group. Logout
and re-login. now you are able to run rvm commands.

    brew install libksba

    rvm install ruby

    brew tap homebrew/dupes
    brew install apple-gcc42

    rvm install 1.9.2

    CFLAGS="-I/opt/X11/include" rvm install 1.8.7


### POW

    curl get.pow.cx | sh

[top](#top)<a name=copy></a>
## Copyright

© 2012 Vitaly Kushner, Astrails Ltd.