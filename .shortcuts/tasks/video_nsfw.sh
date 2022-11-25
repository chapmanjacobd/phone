#!/bin/env fish

# lb x  ~/lb/tax.db ~/d/60_Now_Watching/ &
# lb wt ~/lb/tax.db -u 'play_count, duration desc' -L1 --player termux-open

test -n "$argv"; or set argv "."
open (randvid $argv ~/d/60_Now_Watching/)

