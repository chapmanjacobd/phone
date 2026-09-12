function carmusic
    if pgrep -f mpv >/dev/null
        pkill -f mpv
    else
        lt
    end
end
