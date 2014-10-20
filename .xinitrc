#!/bin/sh

# ~/.xinitrc

. ~/.profile

# gnome-keyring stuff
# I also have the following in /etc/pam.d/slim and /etc/pam.d/i3lock :
# auth		optional	pam_gnome_keyring.so
# session	optional	pam_gnome_keyring.so	auto_start
#eval "$(gnome-keyring-daemon --start --components=pkcs11,secrets,ssh,gpg)"
#export GNOME_KEYRING_CONTROL SSH_AUTH_SOCK GPG_AGENT_INFO GNOME_KEYRING_PID

# Keyboard
setxkbmap sk-altgr alt                    \
	  -option compose:menu            \
          -option terminate:ctrl_alt_bksp &

# merge in defaults and keymaps
[ -f "$HOME/.Xresources" ] && xrdb -merge "$HOME/.Xresources"
[ -f "$HOME/.Xmodmap" ] && xmodmap "$HOME/.Xmodmap"

# fonts
xset +fp /usr/local/lib/X11/fonts/terminus-font
xset fp rehash

# restore background
#eval $(cat ~/.fehbg)

#if [[ -z "$1" ]]; then SESSION="i3"
#else SESSION="$1"
#fi
SESSION=i3

#[[ $SESSION == 'enlightenment' ]] && SESSION='enlightenment_start'
exec $SESSION > .config/xsession.log 2> .config/xsession_errors.log

#kill $GNOME_KEYRING_PID
