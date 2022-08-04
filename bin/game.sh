#!/bin/sh
#notify-send "compositor gamemode " -t 2000
another_instance()
{
        echo "There is another instance running, exiting"
        exit 1
        }
    if [ "$(pgrep game.sh)" != $$ ]; then
             another_instance
fi
sleep 5

while [ -n "$(pgrep overlay)" ] ||  [ -n "$(pgrep SC2)" ] || [ -n "$(pgrep StarCraft)" ]; do
    if  [ -n  "$(pgrep picom)" ]; then
killall picom
    fi
sleep 5
done
picom &
# picom -b --experimental-backends --dbus --config $HOME/.config/bspwm/picom.conf &
exit
