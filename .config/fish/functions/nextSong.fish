function nextSong
    if pgrep mpv
        set socket (dirname (mktemp -u))/mpv_socket
        set song (echo '{ "command": ["get_property", "path"] }' | socat - $socket | jq -r .data)
        rm "$song" &
        echo 'playlist-next force' | socat - $socket
    else if pgrep -f catt
        lb next --delete
    else
        ssh pakon -o RemoteCommand=none lb next --delete
    end

end
