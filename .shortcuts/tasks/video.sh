#!/data/data/com.termux/files/usr/bin/env fish

# lb database add filesystem ~/lb/video.db ~/sync/video/ &
# lb play video ~/lb/video.db -OOO -L1 --player termux-open

test -n "$argv"; or set argv "."
open (randvid $argv ~/sync/video/)
