#!/data/data/com.termux/files/usr/bin/bash
# Works with multiple URLs unlike with termux-open{-url}

url="$1"
url="$url" && [[ ! "$url" =~ ^http ]] && url="http://$url"

echo "$url" >> ~/../tmp/url_log
exec am start --user 0 -a android.intent.action.VIEW -d "$url"
