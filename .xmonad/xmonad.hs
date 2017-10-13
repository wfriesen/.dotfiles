import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO
import Graphics.X11.ExtraTypes.XF86

main = do
    xmproc <- spawnPipe "xmobar"

    xmonad $ docks $ def
        { modMask = mod4Mask
        , manageHook = manageDocks <+> manageHook def
        , layoutHook = avoidStruts  $  layoutHook def
        , logHook = dynamicLogWithPP xmobarPP
                        { ppOutput = hPutStrLn xmproc
                        , ppTitle = xmobarColor "#93a1a1" "" . shorten 50
                        }
        }
        `additionalKeys`
        [
          ((mod4Mask, xK_p), spawn "dmenu_run -fn 'Hack' -z")
        , ((0, xF86XK_AudioRaiseVolume), spawn "amixer set Master 10%+")
        , ((0, xF86XK_AudioLowerVolume), spawn "amixer set Master 10%-")
        , ((0, xF86XK_AudioMute), spawn "amixer set Master toggle")
        ]
