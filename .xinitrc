#!/bin/bash

# ~/.xinitrc

source ~/.profile

# dbus is handled by SLiM since some time this summer
#[[ -z "$DBUS_SESSION_BUS_ADDRESS" ]] && eval "$(dbus-launch --sh-syntax --exit-with-session)"

# gnome-keyring stuff
# I also have the following in /etc/pam.d/slim and /etc/pam.d/i3lock :
# auth		optional	pam_gnome_keyring.so
# session	optional	pam_gnome_keyring.so	auto_start
eval "$(gnome-keyring-daemon --start --components=pkcs11,secrets,ssh,gpg)"
export GNOME_KEYRING_CONTROL SSH_AUTH_SOCK GPG_AGENT_INFO GNOME_KEYRING_PID

# merge in defaults and keymaps
[[ -f "$HOME/.Xresources" ]] && xrdb -merge "$HOME/.Xresources"
[[ -f "$HOME/.Xmodmap" ]] && xmodmap "$HOME/.Xmodmap"

# fonts
xset +fp /usr/share/fonts/local/
xset fp rehash

source ~/.xsession

#if [[ -z "$1" ]]; then SESSION="i3"
#else SESSION="$1"
#fi
SESSION=i3

if [[ $SESSION == 'enlightenment' ]]; then SESSION='enlightenment_start'; fi
exec $SESSION > .config/wm.log 2> .config/wm_errors.log

kill $GNOME_KEYRING_PID
