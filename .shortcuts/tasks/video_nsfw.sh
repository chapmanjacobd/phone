#!/data/data/com.termux/files/usr/bin/fish

set vid (python lb/watch.py lb/tax.db --sort 'duration desc' -p --filename -L 1 -O)
echo "$vid"
open "$vid"
