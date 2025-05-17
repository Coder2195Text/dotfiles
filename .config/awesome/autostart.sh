#!/usr/bin/env bash
function run {
  if ! pgrep -f $1 ;
  then
    $@&
  fi
}

killall picom;
picom -b;
run flameshot
run copyq --start-server
run discord
run gnome-keyring-daemon
run fcitx5
run slimbookbattery --minimize
