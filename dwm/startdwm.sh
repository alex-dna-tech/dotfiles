#!/bin/sh

feh --bg-scale ~/Downloads/wp.png
setxkbmap -layout us,ua -variant dvorak, -option grp:ctl_shift_toggle
xset r rate 200 50 &
dwmblocks &

while true; do
	# Log stderror to a file
	dwm 2>~/.dwm.log
	# No error logging
	#dwm >/dev/null 2>&1
done
