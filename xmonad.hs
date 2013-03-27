import XMonad
import XMonad.Actions.CycleWS
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Layout.NoBorders
import XMonad.Layout.PerWorkspace
import qualified XMonad.StackSet as W
import XMonad.Util.EZConfig(additionalKeys)
import XMonad.Util.Run(spawnPipe)
import XMonad.Hooks.ICCCMFocus

import System.Exit
import System.IO

main = do
    xmproc <- spawnPipe "xmobar"
    xmonad $ defaultConfig
        { borderWidth        = 2
        , normalBorderColor  = "#4C5051"
        , focusedBorderColor = "#FF7B21"
        , workspaces = ["1:main", "2:web", "3:devel", "4:music", "5:graph", "6:edit", "7:mail", "8:transfer", "9:torrent"]
        , layoutHook = avoidStruts $
                        onWorkspace "2:web" (tiled ||| Full) $
                        onWorkspace "3:devel" (Mirror tiled ||| develLayout) $
                        onWorkspace "5:graph" (Full ||| Mirror tiled) $
                        onWorkspace "7:mail" (tiled ||| mailLayout) $
                        smartBorders (tiled ||| Mirror tiled ||| Full )
        , logHook = do
                    takeTopFocus
                    dynamicLogWithPP $ xmobarPP
                        { ppOutput = hPutStrLn xmproc
                        , ppTitle = xmobarColor "#CD9357" "" . shorten 75
                        , ppCurrent = xmobarColor "#5788CD" ""
                        , ppSep = " <fc=#4D4D4D>|</fc> "
                        }
        , modMask = mod4Mask
        , terminal = "rxvt"
        , manageHook = myManageHook
        } `additionalKeys`
        [ ((mod4Mask, xK_p), spawn "dmenu_run -fn 'Dejavu Sans Mono for Powerline:size=9' -nb black -nf white -sb red") ]
  where
    mailLayout  = Tall nmaster delta mailRatio
    tiled       = Tall nmaster delta ratio
    develLayout = Tall nmaster devDelta devRatio

    -- default number of windows in the master pane
    nmaster     = 1

    -- default proportion of screen occupied by master pane
    ratio      = toRational (2/(1+sqrt(5)::Double))  -- golden ratio
    mailRatio  = 0.8                                 -- Pareto ratio, mutt:pidgin
    devRatio   = 80/100

    -- Percent of screen to increment by when resizing panes
    delta      = 0.05
    devDelta   = 3/100

    -- How to handle various windows
    myManageHook = composeAll
        [ className =? "Firefox"            --> doF (W.shift "2:web")
        , className =? "Gimp"               --> doF (W.shift "5:graph")
        , className =? "Gnome-calculator"   --> doFloat
        , className =? "File-roller"        --> doFloat
        , className =? "feh"                --> doFloat
        , className =? "Agave"              --> doFloat
        , className =? "Sublime Text 2"     --> doShift "3:devel"
        , className =? "Gmusicbrowser"      --> doShift "4:music"
        , className =? "Evolution"          --> doShift "7:mail"
        , className =? "Scribus"            --> doShift "6:edit"
        , className =? "Filezilla"          --> doShift "8:transfer"
        , className =? "dragondisk"         --> doShift "8:transfer"
        , className =? "Chromium-browser"   --> doShift "6:edit"
        , title     =? "BOINC Manager"      --> doShift "9:compute"
        , title     =? "Redacción: (sin asunto)"         --> doFloat
        , className =? "Xmessage"           --> doFloat
        , title     =? "qBittorrent"        --> doShift "9:torrent"
        , manageDocks
        ] <+> manageHook defaultConfig
