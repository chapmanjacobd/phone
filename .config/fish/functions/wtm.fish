function wtm
    am startservice --user 0 -n com.termux/com.termux.app.RunCommandService \
        -a com.termux.RUN_COMMAND \
        --es com.termux.RUN_COMMAND_PATH '/data/data/com.termux/files/usr/bin/fish' \
        --esa com.termux.RUN_COMMAND_ARGUMENTS '-c wt --action ask_move_or_delete --keep-dir /data/data/com.termux/files/home/sync/video/keep/ -o each' \
        --es com.termux.RUN_COMMAND_WORKDIR '/data/data/com.termux/files/home' \
        --ez com.termux.RUN_COMMAND_BACKGROUND false \
        --es com.termux.RUN_COMMAND_SESSION_ACTION 0
end
