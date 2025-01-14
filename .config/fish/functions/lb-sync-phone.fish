function lb-sync-phone
    rsync ~/lb/audio.db pakon:/tmp/phone.db && ssh pakon -- tmux new-session -d -s playcounts 'lb copy-play-counts /tmp/phone.db /home/xk/lb/sites/manual/audio.db --source-prefix /storage/6E7B-7DCE/sync/audio/weekly/ --target-prefix /mnt/d/'

    rsync ~/lb/audio.db len:/tmp/phone.db && ssh len -- tmux new-session -d -s playcounts 'lb copy-play-counts /tmp/phone.db /home/xk/lb/sites/manual/audio.db --source-prefix /storage/6E7B-7DCE/ --target-prefix /mnt/d/'
end
