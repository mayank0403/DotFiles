import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO
import XMonad.Hooks.SetWMName
import XMonad.Actions.SpawnOn


main = do
    xmproc <- spawnPipe "xmobar"
    xmonad $ defaultConfig
      { modMask            = mod1Mask
      , borderWidth        = 3
      , normalBorderColor  = "black"
      , focusedBorderColor = "orange"
      , manageHook         = manageDocks <+> manageHook defaultConfig
      , layoutHook         = avoidStruts  $ layoutHook defaultConfig
      -- this must be in this order, docksEventHook must be last
      , handleEventHook    = handleEventHook defaultConfig <+> docksEventHook
      , logHook            = dynamicLogWithPP myPP
          { ppOutput          = hPutStrLn xmproc
          }
      , startupHook        = myStartupHook
      } `additionalKeys`
      [ ((mod4Mask, xK_b), sendMessage ToggleStruts)
      , ((mod4Mask, xK_l), spawn "slock")
      , ((mod4Mask .|. shiftMask, xK_g), spawn "google-chrome")
      , ((mod4Mask .|. shiftMask, xK_m), spawn "mendeleydesktop")
      ]

myPP = xmobarPP { ppOutput          = putStrLn
                , ppCurrent         = xmobarColor "orange" "" . wrap "● " ""
                , ppTitle           = xmobarColor "orange"  "" . shorten 40
                , ppLayout          = xmobarColor "cyan" "" . myLayoutPrinter
                , ppVisible         = xmobarColor "cyan" "" . wrap "○ " ""
                , ppUrgent          = xmobarColor "red" "orange"
                }

toggleStrutsKey XConfig { XMonad.modMask = modMask } = (modMask, xK_b)

myStartupHook = setWMName "LG3D"
             >> spawnHere "xrandr --output DP-1 --mode 1920x1080 --rotate right --pos 1920x-500  --output DVI-I-1 --mode 1920x1200 --rotate normal --pos 0x0"
             >> spawnHere "feh --bg-fill /usr/share/backgrounds/warty-final-ubuntu.png"

mymanager = composeAll
  [ className =? "gimp" --> doFloat
  , className =? "vlc"  --> doFloat
  ]

myLayoutPrinter :: String -> String
myLayoutPrinter "Full" = "[◼]"
myLayoutPrinter "Tall" = "[▮]"
myLayoutPrinter "Mirror Tall" = "[▬]"
myLayoutPrinter x = x
