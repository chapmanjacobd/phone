#!/data/data/com.termux/files/usr/bin/fish

set vid (lb wt ~/lb/tax.db -p f -L1 -u random)
echo "$vid"
open "$vid"
