#!/data/data/com.termux/files/usr/bin/fish

open (python lb/watch.py lb/tax.db --sort 'duration desc' -p --filename -L 1 -O)
