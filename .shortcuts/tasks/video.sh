#!/data/data/com.termux/files/usr/bin/fish

set vid (python lb/watch.py lb/videos.db -p --filename -L 1 -O $argv)
echo "$vid"
open "$vid"
