import XMonad
import XMonad.Actions.CycleWS
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Layout.NoBorders
import XMonad.Layout.PerWorkspace
import qualified XMonad.StackSet as W
import XMonad.Util.EZConfig(additionalKeys)
import XMonad.Util.Run(spawnPipe)
import System.IO
-- import XMonad.Actions.GridSelect
-- import Keys(myKeys)
  
main = do
    xmproc <- spawnPipe "xmobar"
    xmonad $ defaultConfig
        { borderWidth        = 2
        , normalBorderColor  = "#4C5051"
        , focusedBorderColor = "#FF7B21"
        , workspaces = ["1:main", "2:web", "3:devel", "4:music", "5:graph", "6:social", "7:mail", "8:ftp", "9:compute"]
        , layoutHook = avoidStruts $
                        onWorkspace "2:web" (tiled ||| Full) $
                        onWorkspace "3:devel" (Mirror tiled ||| develLayout) $
                        onWorkspace "5:graph" (Full ||| Mirror tiled) $
                        onWorkspace "7:mail" (Full ||| Mirror tiled) $
                        smartBorders (tiled ||| Mirror tiled ||| Full )
        , logHook = dynamicLogWithPP $ xmobarPP
                        { ppOutput = hPutStrLn xmproc
                        , ppTitle = xmobarColor "#CD9357" "" . shorten 75
                        , ppCurrent = xmobarColor "#5788CD" ""
                        , ppSep = " <fc=#4D4D4D>|</fc> "
                        }
        , modMask = mod4Mask
        -- , terminal = "uxterm"
        , manageHook = myManageHook
        } --`additionalKeys` myKeys
  where
    mailLayout  = Tall nmaster delta mailRatio
    tiled       = Tall nmaster delta ratio
    develLayout = Tall nmaster devDelta devRatio
 
    -- default number of windows in the master pane
    nmaster     = 1
 
    -- default propoertion of screen occupied by master pane
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
        , className =? "Eclipse"            --> doShift "3:devel"
        , className =? "Filezilla"          --> doShift "8:ftp"
        , className =? "Chromium-browser"   --> doShift "6:social"
        , title     =? "BOINC Manager"      --> doShift "9:compute"
        , manageDocks
        ] <+> manageHook defaultConfig
