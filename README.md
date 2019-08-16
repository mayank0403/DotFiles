This repository has the following dot files and shell scripts:

1. vimrc: This vimrc comes with preloaded set of useful vim plugins specifically chosen for cpp based programming on linux. Install vim and copy this file to your ~ directory and enter :PluginInstall in vim.

2. updatevim.sh: Since a lot of the plugins in the vimrc require vim 8.1+, run this script to update your existing vim version.

3. installvundle.sh: Vundle is the package manager that I have used in my vimrc. Run this script in your ~ directory to install and set vundle up. This should be done before copying vimrc to ~ directory.

4. installcodequery.sh: This will install and setup codequery which can be used to search symbols, declarations, etc. across a cpp project. Instructions on how to use codequery are in vimrc.

5. installfish.sh: This will install and setup fish shell with a nice ocean theme. Log out and login to set fish as default shell.

6. installxmonad.sh: This script will install xmonad on your linux environment with the default basic config. Copy .xsession file to ~/ directory to autoload the wallpaper each time.

7. config.fish: This is fish config file. Put this in ~/.config/fish/.

To use xmonad with xmobar (status bar):
1. Install xmobar using `apt install xmobar`
2. Go to xmonadplusbar directory
3. Copy xmonad.hs to ~/.xmonad/ directory
4. Copy .xmobarrc to ~/ directory
5. Copy .xsession to ~/ dir
6. Copy myxmonad.desktop to /usr/share/xsessions/ dir
7. Run xmonad --recompile && xmonad --restart to see effects.

For use with dual monitors [MAIN HORIZONTAL][SECONDARY VERTICAL]:
1. Install xmobar.
2. Go to xmonadplusbar_dualmonitor directory
3. Copy xmonad.hs to ~/.xmonad/ directory
4. Copy .xmobarrc to ~/ directory
5. Copy myxmonad.desktop to /usr/share/xsessions/ dir
6. Run xmonad --recompile && xmonad --restart to see effects.
7. You might need to install utf chars using `apt install locales`

*NOTE: The vimrc has custom key bindings that suit my style of programming. Refer to vimrc for comments on how to use different plugins*

Here is how my xmonad and vim configs look like.

![vim config](https://github.com/mayank0403/DotFiles/blob/master/vim.png)
![xmonad config](https://github.com/mayank0403/DotFiles/blob/master/xmonad.png)


