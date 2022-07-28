#!/data/data/com.termux/files/usr/bin/fish

set s (termux-dialog text -i relax -t Searchtext | jq -r '.text')
set t (termux-dialog radio -v "Bedroom speaker","Xylo and Orchestra" | jq -r '.text')
set timer (termux-dialog radio -v 1400,2700,5200 | jq -r '.text')

ssh xk@192.168.1.174 lt-search "$s" "$t" $timer
