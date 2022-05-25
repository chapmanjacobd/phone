#!/data/data/com.termux/files/usr/bin/fish

ssh xk@192.168.1.174 sleepmusic (termux-dialog radio -v "Bedroom speaker","Xylo and Orchestra" | jq '.text')
