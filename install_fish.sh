#!/bin/sh

sudo apt-add-repository ppa:fish-shell/release-3
sudo apt-get update
sudo apt-get install fish

chsh -s /usr/local/bin/fish

chsh -s /usr/bin/fish

curl -L https://get.oh-my.fish | fish

omf install ocean
#on MSR machine, bob-the-fish used. It requires some fonts to be installed.

chsh -s `which fish`
