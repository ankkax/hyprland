#!/bin/sh
player_status=$(dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotifyd /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:'org.mpris.MediaPlayer2.Player' string:'PlaybackStatus' |awk -F '"' '{print $2}'| sed '/^$/d' 2> /dev/null)
if [ "$player_status" = "Playing" ]; then
	echo " $(dbus-send --print-reply \
		--dest=org.mpris.MediaPlayer2.spotifyd /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:'org.mpris.MediaPlayer2.Player' string:'Metadata'| \
		awk -F '"' '/artist/{x=NR+2}(NR<=x){print $2}'| \
		sed '/:\|^$/d') - $(dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotifyd /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:'org.mpris.MediaPlayer2.Player' string:'Metadata'| awk -F '"' '/title/{x=NR+2}(NR<=x){print $2}'| sed '/:\|^$/d')"
elif [ "$player_status" = "Paused" ]; then
    echo " $(dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotifyd /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:'org.mpris.MediaPlayer2.Player' string:'Metadata' | awk -F '"' '/artist/{x=NR+2}(NR<=x){print $2}' | sed '/:\|^$/d') - $(dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotifyd /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:'org.mpris.MediaPlayer2.Player' string:'Metadata' | awk -F '"' '/title/{x=NR+2}(NR<=x){print $2}' | sed '/:\|^$/d')"
fi
