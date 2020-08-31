#!/bin/sh
maim /tmp/screen.png
convert /tmp/screen.png -scale 2.5% -scale 4000% /tmp/screen.png
[[ -f /home/user/images/icons/lock-icon.png ]]
i3lock -i /tmp/screen.png
rm /tmp/screen.png
xset dpms force off
