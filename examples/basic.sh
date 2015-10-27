# config SCRIPT file is just a shell script

# each variable is defined by calling 'ask' and can be preceded by 'default', 'validate' and 'desk'

# default gives the value that will be used if user just presses ENTER on the prompt
default 'y'

# validate defines accepted values
# bool[ean] - case insensitive, acceptable values are y, yes, n, no
# num[ber] - number
# word - sequence of letters
# sym[bol] - sequence of letters, numbers, and '_'
# simple - simple string, basicly symbols with spaces
# str[ing] - any non empty string
# any - anhitng
#
# default validation is 'bool'
validate 'bool'

# description is printed before the prompt and as a comment in the config file
desc 'this is a boolean variable with default of y'

# this will actually prompt the user and save the answer in config file
ask ok "understood?"

validate num
default 123
ask foo "give me a number"

validate any
desc "This variable will accept anything, even an empty string"
default "note that default can contain \"double\" and 'single' quotes"
ask bar "give me any string"
