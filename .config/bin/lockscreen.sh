#!/bin/bash
# ~/.config/bin/lockscreen.sh

TIME=2  # min
LOCKER='i3lock -u -c 000000'

xautolock -time $TIME -locker "$LOCKER" -detectsleep

# the following is used because toggle didn't work for me
xdotool behave_screen_edge --delay 1000 top-left  exec xautolock -locknow
xdotool behave_screen_edge --delay 1000 top-right exec xautolock -toggle
