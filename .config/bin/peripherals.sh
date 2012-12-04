#!/bin/bash

# my input and screen preferences

# keyboard
setxkbmap -option compose:menu
[[ -f $HOME/.Xmodmap ]] && xmodmap $HOME/.Xmodmap

# touchpad
synclient VertEdgeScroll=0 HorizEdgeScroll=0 \
		  CircularScrolling=0 \
		  VertTwoFingerScroll=1 HorizTwoFingerScroll=1 \
		  VertScrollDelta=130 HorizScrollDelta=130 \
		  CoastingSpeed=16 CoastingFriction=30 \
		  EdgeMotionUseAlways=1 \
		  ClickPad=1 \
		  TapButton1=1 TapButton2=2 TapButton3=3 \
		  ClickFinger1=1 ClickFinger2=3 ClickFinger3=2 \
		  RightButtonAreaLeft=5000 \
		  PalmDetect=1 \

# "natural scrolling"
xinput set-button-map 'SynPS/2 Synaptics TouchPad' 1 2 3 5 4 7 6

# touchscreen-helper &
# twofing --click=second &

# trackpad
TRACKPAD_ID=`xinput list | grep 'TrackPoint' | grep pointer | cut -f2 | cut -f2 -d'='`
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
