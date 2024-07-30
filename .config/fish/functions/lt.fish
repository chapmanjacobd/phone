function lt
    lb lt ~/lb/audio.db --refresh -k delete-if-audiobook -u play_count -r --fetch-siblings each $argv
end
