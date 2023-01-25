function carmusic
    if pgrep mpv >/dev/null
        pkill mpv
    else
        lt
    end
end
