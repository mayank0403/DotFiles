#!/bin/sh

sudo apt-get install curl

curl -sSL https://get.haskellstack.org/ | sudo sh

sudo apt-get -y install libx11-dev libxinerama-dev libxext-dev libxrandr-dev libxss-dev libxft-dev libghc-xmonad-contrib-dev libghc-xmonad-dev suckless-tools

stack install xmonad

mkdir ~/.xmonad

touch ~/.xmonad/xmonad.hs

cp xmonad.hs ~/.xmonad/.

xmonad --version && xmonad --recompile

sudo cp myxmonad.desktop /usr/share/xsessions/.

#Set a background for xmonad
sudo apt-get install feh

feh --bg-scale /usr/share/backgrounds/warty-final-ubuntu.png &


