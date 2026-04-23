#!/bin/bash

pkill pulseaudio
pkill virgl_test_server_android
pkill -9 -f termux.x11

am start --user 0 -n com.termux.x11/com.termux.x11.MainActivity
XDG_RUNTIME_DIR=${TMPDIR}
termux-x11 :0 -ac &
sleep 3

pulseaudio --start --exit-idle-time=-1
pacmd load-module module-native-protocol-tcp auth-ip-acl=127.0.0.1 auth-anonymous=1

virgl_test_server_android &

proot-distro login archlinux --user xk --shared-tmp -- bash -c "rm -rf /tmp/.X11-unix /tmp/.ICE-unix; export DISPLAY=:0 PULSE_SERVER=tcp:127.0.0.1; dbus-launch --exit-with-session startxfce4"
