#!/data/data/com.termux/files/usr/bin/fish

ssh xk@192.168.1.174 pkill -f -x 'python -m listen audio.db -r -O -cast'
