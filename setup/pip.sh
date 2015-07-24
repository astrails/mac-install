if [ -z "`which pip`" ]; then
  ask "install python pip" &&
    sudo easy_install pip
fi

if [ -z "`which howdoi`" ]; then
  ask "install howdoi" &&
    pip install howdoi
fi
