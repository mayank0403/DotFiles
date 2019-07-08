import XMonad
 
main = xmonad def
  { modMask     = mod4Mask -- set 'Mod' to windows key
  , terminal    = "gnome-terminal" -- for Mod + Shift + Enter
  }
