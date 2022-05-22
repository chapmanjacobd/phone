function nextSong
    set song (echo '{ "command": ["get_property", "path"] }' | socat - /tmp/mpv_socket | jq -r .data)
    trash-put $song
    echo 'playlist-next force' | socat - /tmp/mpv_socket
end
