function lt
    ~/lb
    lb lt ~/lb/audio.db -k delete-if-audiobook -w 'play_count=0' -u random -O $argv
end
