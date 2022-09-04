function skipthrough

    echo 'seek 20' | socat - ~/../tmp/mpv_socket
    sleep 2
    echo 'seek 20' | socat - ~/../tmp/mpv_socket
    sleep 1
    echo 'seek 50' | socat - ~/../tmp/mpv_socket
end
