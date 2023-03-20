function yta
    ytdl -f bestaudio[ext=opus]/bestaudio[ext=webm]/bestaudio[ext=ogg]/bestaudio[ext=oga]/bestaudio/best \
        --match-filter "live_status=?not_live" $argv
end
