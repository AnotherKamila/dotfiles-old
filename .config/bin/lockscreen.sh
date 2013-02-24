#!/bin/bash
# ~/.config/bin/lockscreen.sh

TIME=3  # min
# LOCKER="i3lock -u -c 000000 -i ~/lockscreen.png"
LOCKER="bash -c 'xdotool mousemove_relative 50 -50 && i3lock -u -c 000000 -i ~/.config/gfx/lockscreen.png'"

xautolock -time $TIME -locker "$LOCKER" -detectsleep -corners 00+- -cornerdelay 1 &

echo "xautolock active, timeout ${TIME}min"
