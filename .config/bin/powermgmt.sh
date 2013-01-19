#!/bin/bash
read -r -d '' CHOICES <<- 'EOF'
	1. suspend   : systemctl suspend
	2. hibernate : systemctl hibernate
	3. power off : systemctl poweroff
	4. reboot    : systemctl reboot
EOF

R=`echo "$CHOICES" | sed 's/ *: *.*$//g' | dmenu -i -fn '-*-terminus-medium-*-*-*-*-160-72-72-*-*-iso10646-*' -nb \#268bd2 -nf \#073642 -sb \#073642 -sf \#fff`
CMD=`echo "$CHOICES" | grep "$R" | sed 's/.*://g'`
$CMD
