function pakonmusic
    if ssh -o BatchMode=yes -o ConnectTimeout=3 pakon "pgrep -f 'lb (listen|lt)'"
        ssh pakon lt.stop
    else
        ssh pakon lt.start
    end
end
