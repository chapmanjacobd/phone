function volup
    if pgrep mpv >/dev/null
        music_volume up
    else
        ssh pakon catt volumeup 6
    end
end
