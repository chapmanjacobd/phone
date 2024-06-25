# Defined in /home/xk/.config/fish/functions/ffsmallpar.fish @ line 2
function ffsmallpar
    if not create_lock_file ffsmallpar
        echo "ffsmallpar already running..."
        return 1
    end

    set tmpfile (mktemp)
    fd . $argv -S+200MB | grep -v .av1. | sort_size.py >$tmpfile

    if not test -s $tmpfile
        return
    end

    ssh -fN pulse15 # workaround for VisualHostKey
    ssh -fN backup
    cat $tmpfile | timeout -s HUP 18h parallel --sshloginfile ~/.parallel/sshloginfile.ffmpeg --transfer "lb process-video {} && rsync -auh --remove-sent-files {.}.av1.mkv" $hostname:(pwd) >/dev/null

    for pc in backup pulse15
        rsync -auh --info=progress2 --no-inc-recursive --partial-dir=.rsync-partial --remove-sent-files $pc:\*.av1.mkv .
    end

    for f in (cat $tmpfile)
        if test -e $f -a -e (path change-extension av1.mkv $f)
            rm "$f"
            archive (path resolve (path change-extension av1.mkv $f))
        end
    end
    ssh backup fd -HI -eMKV -eMP4 -d1 -x rm
    ssh pulse15 fd -HI -eMKV -eMP4 -d1 -x rm

    clear_lock_file ffsmallpar
end
