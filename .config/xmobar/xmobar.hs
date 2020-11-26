-- http://projects.haskell.org/xmobar/
-- install xmobar with these flags: --flags="with_alsa" --flags="with_mpd" --flags="with_xft"  OR --flags="all_extensions"
Config { font    = "xft:Noto Sans:pixelsize=14:antialias=true:hinting=true"
       , additionalFonts = [ "xft:FontAwesome:pixelsize=13" ]
       , bgColor = "#282A36"
       , fgColor = "#B45BCF"
       , position = Top
       , alpha = 105
       , lowerOnStart = True
       , hideOnStart = False
       , allDesktops = True
       , persistent = True
       , iconRoot = "/home/konner/"  -- default: "."
       , commands = [ 
                      -- Time and date
                      Run Date "%a %b %e %Y %l:%M:%S %p" "date" 5
                      -- Network up and down
                    , Run Network "wlp2s0" ["-t", "\xf0aa <rx>kb  \xf0ab <tx>kb"] 20
                      -- Cpu usage in percent
                    , Run Cpu ["-t", "CPU: <total>%,","-H","70","--high","red"] 20
                      -- Ram used number and percent
                    , Run Memory ["-t", "RAM: <used>M (<usedratio>%)"] 20
                      -- Disk space free
                    , Run DiskU [("/", "HDD: <free> free")] [] 60
		    , Run Battery        [ "--template" , "<acstatus>"
                             , "--Low"      , "10"        -- units: %
                             , "--low"      , "red"
                            -- , "--normal"   , "white"
			     , "--" -- battery specific options
                                       -- discharging status
                                       , "-o"	, "<left>% (<timeleft>) left"
                                       -- AC "on" status
                                       , "-O"	, "Charging: <left>%"
                                       -- charged status
                                       , "-i"	, "Charged: <left>%"
			     ] 50
		    , Run Weather "KGDJ" ["-t","<station>: <tempF>° F",
                                          "-L","70","-H","90",
                                          "--normal","green",
                                          "--high","red",
                                          "--low","lightblue"] 5
                    , Run Volume "default" "Master" [] 1
                    , Run ThermalZone 0 ["-t","<temp>° C"] 20
                    ]
       , sepChar = "%"
       , alignSep = "}{"
       , template = " }{<fc=#b77bfc>%default:Master%</fc><fc=#666666>| </fc><fc=#b77bfc> %cpu% %thermal0% </fc><fc=#666666>| </fc><fc=#b77bfc>%memory% </fc><fc=#666666>| </fc><fc=#b77bfc>%battery% </fc><fc=#666666>| </fc><fc=#b77bfc>%KGDJ% </fc><fc=#666666>| </fc><fc=#b77bfc>%date%</fc> <fc=#666666>|</fc> <icon=xmonadlogo.xpm/>  "
             }
