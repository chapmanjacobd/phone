#!/data/data/com.termux/files/usr/bin/fish

lb x  ~/lb/tax.db ~/d/60_Now_Watching/
lb wt ~/lb/tax.db -u 'duration desc' -L1 --player termux-open
