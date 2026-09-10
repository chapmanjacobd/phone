function randmusic
    if pgrep -f mpv >/dev/null
        pkill -f mpv
    else
        lt
    end
end
