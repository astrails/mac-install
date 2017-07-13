#!/bin/bash -ex
TAR=~/app-settings.tgz

rm -f $TAR

cd ~
tar zcf $TAR \
"Library/Application Support/Mailplane 3" \
"Library/Application Support/Alfred 3" \
".config/direnv" \
".ssh" \
"Library/Application Support/Skype/vitaly.k" \
Library/Fonts/*.*f \
"Library/Containers/com.apple.Preview/Data/Library/Preferences/com.apple.Preview.signatures.plist"
