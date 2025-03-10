i3-nagbar -t warning -m 'Choose Action' -B 'Logout' 'i3-msg exit' -B 'Restart' 'reboot' -B 'Power Off' 'poweroff' &
PID=$!
xdotool search --sync --all --pid ${PID} --name '.*' set_window --classname "i3-nagbar" set_window --class "i3-nagbar"

