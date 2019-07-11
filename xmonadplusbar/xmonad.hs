import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO
import XMonad.Hooks.SetWMName


main = do
    xmproc <- spawnPipe "xmobar"
    xmonad $ defaultConfig
      { modMask            = mod4Mask
      , manageHook         = manageDocks <+> manageHook defaultConfig
      , layoutHook         = avoidStruts  $ layoutHook defaultConfig
      -- this must be in this order, docksEventHook must be last
      , handleEventHook    = handleEventHook defaultConfig <+> docksEventHook
      , logHook            = dynamicLogWithPP xmobarPP
          { ppOutput          = hPutStrLn xmproc
          , ppTitle           = xmobarColor "darkgreen"  "" . shorten 20
          , ppHiddenNoWindows = xmobarColor "grey" ""
          }
      , startupHook        = setWMName "LG3D"
      } `additionalKeys`
      [ ((mod4Mask, xK_b), sendMessage ToggleStruts) ]

myPP = xmobarPP { ppOutput          = putStrLn
                , ppCurrent         = xmobarColor "#336433" "" . wrap "[" "]"
                --, ppHiddenNoWindows = xmobarColor "grey" ""
                , ppTitle           = xmobarColor "darkgreen"  "" . shorten 20
                , ppLayout          = shorten 6
                --, ppVisible         = wrap "(" ")"
                , ppUrgent          = xmobarColor "red" "yellow"
                }

toggleStrutsKey XConfig { XMonad.modMask = modMask } = (modMask, xK_b)

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
