function pakonmusic
    if ssh xk@192.168.1.114 pgrep 'lb listen' >/dev/null
        ssh xk@192.168.1.114 lt-stop
    else
        ssh xk@192.168.1.114 lt-start
    end
end
