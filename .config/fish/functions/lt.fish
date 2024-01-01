function lt
    lb lt ~/lb/audio.db -k delete-if-audiobook -w 'play_count=0' -r --fetch-siblings if-audiobook $argv
end
