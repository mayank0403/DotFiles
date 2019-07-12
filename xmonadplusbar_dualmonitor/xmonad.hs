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
      , manageHook         = manageDocks <+> manageHook defaultConfig
      , layoutHook         = avoidStruts  $ layoutHook defaultConfig
      -- this must be in this order, docksEventHook must be last
      , handleEventHook    = handleEventHook defaultConfig <+> docksEventHook
      , logHook            = dynamicLogWithPP xmobarPP
          { ppOutput          = hPutStrLn xmproc
          , ppTitle           = xmobarColor "darkgreen"  "" . shorten 20
          , ppHiddenNoWindows = xmobarColor "grey" ""
          }
      , startupHook        = myStartupHook
      } `additionalKeys`
      [ ((mod4Mask, xK_b), sendMessage ToggleStruts) ]

myPP = xmobarPP { ppOutput          = putStrLn
                , ppCurrent         = xmobarColor "#336433" "" . wrap "[" "]"
                , ppHiddenNoWindows = xmobarColor "grey" ""
                , ppTitle           = xmobarColor "darkgreen"  "" . shorten 20
                , ppLayout          = shorten 6
                , ppVisible         = wrap "(" ")"
                , ppUrgent          = xmobarColor "red" "yellow"
                }

toggleStrutsKey XConfig { XMonad.modMask = modMask } = (modMask, xK_b)

myStartupHook = setWMName "XMonad"
             >> spawnHere "xrandr --output DP-1 --mode 1920x1080 --rotate right --pos 1920x-500  --output DVI-I-1 --mode 1920x1200 --rotate normal --pos 0x0"
             >> spawnHere "feh --bg-scale /usr/share/backgrounds/warty-final-ubuntu.png"

myworkspaces = [ "w1"
               , "w2"
               , "w3"
               , "w4"
               , "w5"
               , "w6"
               , "w7"
               , "w8"
               , "w9"
               ]

mymanager = composeAll
  [ className =? "gimp" --> doFloat
  , className =? "vlc"  --> doFloat
  ]
