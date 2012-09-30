#!/bin/bash

# my input and screen preferences

# keyboard
setxkbmap -option compose:menu
[[ -f $HOME/.Xmodmap ]] && xmodmap $HOME/.Xmodmap 

# touchpad
synclient VertEdgeScroll=0 HorizEdgeScroll=0\
		  VertTwoFingerScroll=1 HorizTwoFingerScroll=1\
		  EdgeMotionUseAlways=1\
		  TapButton1=1\
		  PalmDetect=1\
		  CircularScrolling=0

# touchscreen-helper &
# twofing --click=second &

# trackpad
TRACKPAD_ID=`xinput list | grep 'ThinkPad USB Keyboard with TrackPoint' | grep pointer | cut -f2 | cut -f2 -d'='`
if [[ -n $TRACKPAD_ID ]]; then
	xinput set-int-prop $TRACKPAD_ID "Evdev Wheel Emulation Axes" 8 6 7 4 5
	xinput set-int-prop $TRACKPAD_ID "Evdev Wheel Emulation Button" 8 2
	xinput set-int-prop $TRACKPAD_ID "Evdev Wheel Emulation" 8 1
fi

# multi-monitor
xrandr --output LVDS1 --auto
if [[ -n `xrandr | grep 'VGA1 connected'` ]]; then
	xrandr --output VGA1 --right-of LVDS1 --auto
else
	xrandr --output VGA1 --off
fi
