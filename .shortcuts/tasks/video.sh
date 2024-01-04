#!/data/data/com.termux/files/usr/bin/env fish

# lb x  ~/lb/video.db ~/sync/video/ &
# lb wt ~/lb/video.db -OOO -L1 --player termux-open

test -n "$argv"; or set argv "."
open (randvid $argv ~/sync/video/)
