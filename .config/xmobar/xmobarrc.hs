-- http://projects.haskell.org/xmobar/
-- install xmobar with these flags: --flags="with_alsa" --flags="with_mpd" --flags="with_xft"  OR --flags="all_extensions"
Config { font    = "xft:Noto Sans:pixelsize=14:antialias=true:hinting=true"
       , additionalFonts = [ "xft:FontAwesome:pixelsize=13" ]
       , bgColor = "#282A36"
       , fgColor = "#B45BCF"
       , position = Top
       , alpha = 100
       , lowerOnStart = True
       , hideOnStart = False
       , allDesktops = True
       , persistent = True
       , iconRoot = "/home/konner/"  -- default: "."
       , commands = [ 
                      -- Time and date
                      Run Date "%a %b%e %Y %l:%M:%S %p" "date" 5
                      -- Network up and down
                    , Run Network "wlp2s0" ["-t", "\xf0aa <rx>kb  \xf0ab <tx>kb"] 20
                      -- Cpu usage in percent
                    , Run Cpu ["-t", "CPU: <total>%","-H","70","--high","red"] 20
                      -- Ram used number and percent
                    , Run Memory ["-t", "RAM: <used>M (<usedratio>%)"] 20
                      -- Disk space free
                    , Run DiskU [("/", "HDD: <free> free")] [] 60
                      -- Runs custom script to check for pacman updates.
                      -- This script is in my dotfiles repo in .local/bin.
                    , Run Com "pacupdate" [] "" 36000
                      -- Runs a standard shell command 'uname -r' to get kernel version
                    , Run Com "uname" ["-r"] "" 36000
                      -- Prints out the left side items such as workspaces, layout, etc.
                      -- The workspaces are 'clickable' in my configs.
                    , Run UnsafeStdinReader
		    , Run Battery        [ "--template" , "<acstatus>"
                             , "--Low"      , "10"        -- units: %
                             , "--low"      , "red"
                             , "--normal"   , "white"
			     , "--" -- battery specific options
                                       -- discharging status
                                       , "-o"	, "<left>% left"
                                       -- AC "on" status
                                       , "-O"	, "Charging: <left>%"
                                       -- charged status
                                       , "-i"	, "Charged <left>%"
			     ] 50
		    , Run Weather "KGDJ" ["-t","<station>: <tempF>° F",
                                          "-L","70","-H","90",
                                          "--normal","green",
                                          "--high","red",
                                          "--low","lightblue"] 120
                    ]
       , sepChar = "%"
       , alignSep = "}{"
       , template = " }{<fc=#b77bfc> %cpu% </fc><fc=#666666>| </fc><fc=#b77bfc>%memory% </fc><fc=#666666>| </fc><fc=#b77bfc>%battery% </fc><fc=#666666>| </fc><fc=#b77bfc>%KGDJ% </fc><fc=#666666>| </fc><fc=#b77bfc>%date%</fc> <fc=#666666>|</fc> <icon=xmonadlogo.xpm/>  "
       }
