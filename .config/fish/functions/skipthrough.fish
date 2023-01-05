function skipthrough
    echo 'seek 20' | socat - $MPV_SOCKET
    sleep 2
    echo 'seek 20' | socat - $MPV_SOCKET
    sleep 1
    echo 'seek 50' | socat - $MPV_SOCKET
end
