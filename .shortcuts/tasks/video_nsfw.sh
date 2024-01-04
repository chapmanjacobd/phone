#!/data/data/com.termux/files/usr/bin/env fish

# lb x  ~/lb/tax.db ~/sync/porn/video/ &
# lb wt ~/lb/tax.db -u 'play_count, duration desc' -L1 --player termux-open

test -n "$argv"; or set argv "."
open (randvid $argv ~/sync/porn/video/)
