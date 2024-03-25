function lb-sync-phone
    for pc in pakon pulse15
        rsync ~/lb/audio.db $pc:/tmp/phone.db && ssh $pc -- tmux new-session -d -s playcounts 'lb copy-play-counts /home/xk/lb/audio.db /tmp/phone.db --source-prefix /storage/6E7B-7DCE/sync/audio/weekly/ --target-prefix /mnt/d/'
    end
end
