#!/bin/env fish

# lb x  ~/lb/video.db ~/d/70_Now_Watching/ &
# lb wt ~/lb/video.db -OOO -L1 --player termux-open

test -n "$argv"; or set argv "."
open (randvid $argv ~/d/70_Now_Watching/)
