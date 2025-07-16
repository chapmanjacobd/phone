#!/data/data/com.termux/files/usr/bin/sh
termux-wake-lock

sv up crond

if ! pgrep "crond" >/dev/null; then
    echo "[Starting crond...]" && crond && echo "[OK]"
fi

. $PREFIX/etc/profile

termux-wake-unlock
