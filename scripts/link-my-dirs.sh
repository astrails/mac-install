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
$L my/dev/nvm .nvm
#$L my/xxx xxx
#$L my/xxx xxx
#$L my/xxx xxx
#$L my/xxx xxx
#$L my/xxx xxx
#$L my/xxx xxx
