function lt.playing
    pgrep -f 'lb listen' >/dev/null 2>&1
    or pgrep -f 'lb lt' >/dev/null 2>&1
    or pgrep -f 'mpv .*mpv_socket' >/dev/null 2>&1
end
