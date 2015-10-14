# Simple configuration tool written in bash

> Note: it feels like something like this should already exist, and yet I
> couldn't find anything that quite fits the bill. I'll be happy to find
> someone elses tool so that I can stop wasting time ;)

Usage: bin/config `CONFIG_OUTPUT` `CONFIG_DEFINITION` [`CONFIG_DEFINITION` ...]

e.g.:

    bin/config config example

see `example` file for definition file format

if `CONFIG_OUTPUT` file exists `bin/config` will read it and re-use the values
inside where possible. to force prompt on each variable, even if it is already
defined in `CONFIG_OUTPUT` file pass `-f` parameter:

    bin/config -f config example
