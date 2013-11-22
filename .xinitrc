#!/bin/sh

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# Add font paths
xset fp default
[[ -d /usr/share/fonts/local ]] && xset +fp /usr/share/fonts/local
[[ -d $HOME/.fonts ]] && xset +fp $HOME/.fonts
xset fp rehash

# Load Xresources
xrdb -merge ~/.Xdefaults

# Start user systemd
systemd --user &

# start terminal daemon
urxvtd -q -o -f  &
parcellite -d -n &
xset s off
xset -dmps

exec openbox-session
