#!/data/data/com.termux/files/usr/bin/sh
termux-wake-lock

pkill crond; rm ../usr/var/run/crond.pid
crond

. $PREFIX/etc/profile

termux-wake-unlock
