#!/data/data/com.termux/files/usr/bin/bash
# Works with multiple URLs unlike with termux-open{-url}

exec am start --user 0 -a android.intent.action.VIEW -d "$1" >/dev/null
