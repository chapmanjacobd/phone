function lt.playing
    pgrep -f 'lb play audio' >/dev/null 2>&1
    or pgrep -f 'mpv .*mpv_socket' >/dev/null 2>&1
end
