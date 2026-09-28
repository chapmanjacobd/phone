# leaf: the phone plays through its own speaker unless a cast is running
function catt.volume.up
    if pgrep -f mpv >/dev/null
        music_volume up
    else if pgrep -f 'catt ' >/dev/null
        catt -d (lt.device) volumeup 6
    end
end
