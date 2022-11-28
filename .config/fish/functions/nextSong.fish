function nextSong
    if pgrep -f 'lb lt'
        set socket (dirname (mktemp -u))/mpv_socket
        set song (echo '{ "command": ["get_property", "path"] }' | socat - $socket | jq -r .data)
        trash-put "$song" &
        pkill mpv
    else
        ssh 10400 -o RemoteCommand=none lb next --delete
    end

end
