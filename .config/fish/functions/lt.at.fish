# lt.at ACTION — run a playback verb on the machine that is playing.
#
#   next      delete the playing file, go to the next one
#   stop      stop playback        pause/play  toggle playback
#   now       what is playing
#
# A queue here (lb listen/lt) or a local mpv video means this machine is
# playing: act here. Otherwise len and pakon forward to each other, and the
# phone asks the computers who is playing. stop with nothing playing is a
# no-op (lt.start relies on that). The speaker is lt.device TARGET, so a verb
# sent to pakon lands on pakon's speaker.
function lt.at --argument action
    set -l target
    if lt.playing
        set target (hostname)
    else
        switch (hostname)
            case len
                set target pakon
            case pakon
                set target len
            case '*'
                if ssh -o BatchMode=yes -o ConnectTimeout=3 pakon lt.playing
                    set target pakon
                else if ssh -o BatchMode=yes -o ConnectTimeout=3 len lt.playing
                    set target len
                end
        end
    end

    if test -z "$target"
        if test "$action" = stop
            return 0
        end
        echo "lt.at: nothing is playing" >&2
        return 1
    end

    set -l cmd
    set -l target_args
    switch $action
        case next
            set cmd lb next --delete-files
            set target_args -t (lt.device $target)
        case stop
            set cmd lb stop
            set target_args -t (lt.device $target)
        case pause play
            set cmd lb pause
            set target_args -t (lt.device $target)
        case now
            set cmd lb now
        case '*'
            echo "lt.at: no such action: $action" >&2
            return 1
    end

    echo "lt.at: $action on $target" >&2
    if test "$target" = (hostname)
        $cmd $target_args $argv[2..-1]
    else
        # ssh runs its arguments as one remote command line, so they need quoting
        set -l quoted
        for word in $target_args
            set -a quoted (string escape -- $word)
        end
        ssh -o BatchMode=yes -o ConnectTimeout=3 $target $cmd $quoted $argv[2..-1]
    end
end
