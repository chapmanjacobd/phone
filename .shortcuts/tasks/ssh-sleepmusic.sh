#!/data/data/com.termux/files/usr/bin/env fish

set s (termux-dialog text -i relax -t Searchtext | jq -r '.text')
set t (termux-dialog radio -v "Bedroom pair","Xylo and Orchestra" | jq -r '.text')
set timer (termux-dialog radio -v 1400,2700,5200 | jq -r '.text')

set -q s; or set s relax
set -q t; or set t "Bedroom pair"
set -q timer; or set timer 480


ssh xk@192.168.1.114 lt-search "$s" "$t" $timer
