#!/bin/bash

# my input and screen preferences

# touchpad
# the negative ScrollDelta values are the "natural scrolling" hack that confuses people so much
synclient VertEdgeScroll=0 HorizEdgeScroll=0 \
	  CircularScrolling=0 \
	  VertTwoFingerScroll=1 HorizTwoFingerScroll=1 \
	  VertScrollDelta=-130 HorizScrollDelta=-130 \
	  CoastingSpeed=16 CoastingFriction=30 \
	  ClickPad=1 \
	  TapButton1=1 TapButton2=0 TapButton3=0 \
	  ClickFinger1=1 ClickFinger2=0 ClickFinger3=0 \
	  RightButtonAreaLeft=5000 \
	  PalmDetect=1 \
	  &

# trackpad (both internal and on USB keyboard)
TRACKPAD_ID=`xinput list | grep 'TrackPoint' | grep pointer | cut -f2 | cut -f2 -d'='`
if [[ -n $TRACKPAD_ID ]]; then
	xinput set-int-prop $TRACKPAD_ID 'Evdev Wheel Emulation Axes' 8 6 7 4 5  &
	xinput set-int-prop $TRACKPAD_ID 'Evdev Wheel Emulation Button' 8 2  &
	xinput set-int-prop $TRACKPAD_ID 'Evdev Wheel Emulation' 8 1  &
fi

# screen brightness
xbacklight -set 50

# multi-monitor
xrandr --output LVDS1 --auto
EXTM=`xrandr | grep '\<connected\>' | grep -v LVDS1 | cut -d' ' -f1`
if [[ -n $EXTM ]]; then
	echo "$0: setting up display: $EXTM"
	xrandr --output $EXTM --above LVDS1 --auto &
else
	for m in VGA1 HDMI1 DP1; do xrandr --output $m --off; done
	xrandr --output LVDS1 --auto
fi
