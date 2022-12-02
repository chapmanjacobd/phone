function randmusic
    if pgrep mpv >/dev/null
        pkill mpv
    else if timeout 0.4 nc -z 192.168.1.174 22 2>/dev/null
        if ssh xk@192.168.1.174 pgrep lt >/dev/null
            ssh xk@192.168.1.174 lt-stop
        else
            ssh xk@192.168.1.174 lt-start
        end
    else
        lt
    end
end
