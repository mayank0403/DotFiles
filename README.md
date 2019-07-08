This repository has the following dot files and shell scripts:

1. vimrc: This vimrc comes with preloaded set of useful vim plugins specifically chosen for cpp based programming on linux. Install vim and copy this file to your ~ directory and enter :PluginInstall in vim.

2. updatevim.sh: Since a lot of the plugins in the vimrc require vim 8.1+, run this script to update your existing vim version.

3. installvundle.sh: Vundle is the package manager that I have used in my vimrc. Run this script in your ~ directory to install and set vundle up. This should be done before copying vimrc to ~ directory.

4. installcodequery.sh: This will install and setup codequery which can be used to search symbols, declarations, etc. across a cpp project. Instructions on how to use codequery are in vimrc.

5. installfish.sh: This will install and setup fish shell with a nice ocean theme. Log out and login to set fish as default shell.

6. installxmonad.sh: This script will install xmonad on your linux environment with the default basic config. Copy add_bg.desktop to ~/.config/autostart/ directory to autoload the wallpaper each time.

*NOTE: The vimrc has custom key bindings that suit my style of programming. Refer to vimrc for comments on how to use different plugins*
