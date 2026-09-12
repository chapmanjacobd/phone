function voldown
    if pgrep -f mpv >/dev/null
        music_volume down
    else
        ssh pakon catt volumedown 9
    end

end
