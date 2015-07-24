function heroku_plugin()
{
  if [ ! -d ~/.heroku/plugins/$1 ]; then
    info installing heroku plugin $1
    heroku plugins:install $2
  fi
}

heroku_plugin heroku-accounts git://github.com/ddollar/heroku-accounts.git

if [ -n "`which heroku`" -a -d ~/.heroku ]; then
  _ln ~/my/config/heroku-accounts ~/.heroku/accounts
else
  warn "please install heroku toolbelt from https://toolbelt.heroku.com/osx"
fi
