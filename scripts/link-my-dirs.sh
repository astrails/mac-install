#!/bin/bash -ex

L="ln -sfn"

cd ~
$L my/astrails a
$L my/config/aws .aws
$L my/config/dirs .g
$L my/config/dotfiles .dot
$L my/bin bin
$L my/dev dev
$L my/config/mac-install mac-install
$L my/files/txt txt
$L my/config/dotzsh .zsh
$L .zsh/zshrc .zshrc
$L .zsh/zprofile .zprofile
$L my/dev/nvm .nvm
$L my/files/docker .docker
$L my/dev/snippets snippets
$L Downloads d
$L my/files/vimwiki
$L my/files/tasks .task
$L my/files/tasks/taskrc .taskrc
#$L my/xxx xxx
#$L my/xxx xxx
#$L my/xxx xxx
