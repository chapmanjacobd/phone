function catt.volume.down
    if pgrep -f mpv >/dev/null
        music_volume down
    else if pgrep -f 'catt ' >/dev/null
        catt -d (lt.device) volumedown 9
    end
end
