function lt
    lb play audio --db ~/lb/audio.db --refresh -k delete-if-audiobook -u play_count --fetch-siblings if-audiobook -r $argv
end
