focusedwindow_before=$(xdotool getactivewindow)
flameshot gui
[ "$focusedwindow_before" = "$(xdotool getactivewindow)" ] && xdotool windowfocus $focusedwindow_before
