function randmusic
    if pgrep mpv >/dev/null
        pkill mpv
    else if timeout 0.4 nc -z 192.168.1.114 22 2>/dev/null
        if ssh xk@192.168.1.114 pgrep lb >/dev/null
            ssh xk@192.168.1.114 lt-stop
        else
            ssh xk@192.168.1.114 lt-start
        end
    else
        lt
    end
end
