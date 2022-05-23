function randmusic
    if pgrep mpv >/dev/null
        pkill mpv
    else
        mpv --input-ipc-server=~/../tmp/mpv_socket --shuffle ~/d/80_Now_Listening/
    end
end
