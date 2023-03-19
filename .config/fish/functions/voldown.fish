function voldown
    if pgrep mpv >/dev/null
        music_volume down
    else
        ssh pakon catt volumedown 9
    end

end
