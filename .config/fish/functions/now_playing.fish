function now_playing
echo '{ "command": ["get_property", "path"] }' | socat - ~/../tmp/mpv_socket | jq -r .data
end
