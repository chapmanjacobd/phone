function nextSong
    set socket ~/../tmp/mpv_socket
    set song (echo '{ "command": ["get_property", "path"] }' | socat - $socket | jq -r .data)
    trash-put $song
    echo 'playlist-next force' | socat - $socket
end
