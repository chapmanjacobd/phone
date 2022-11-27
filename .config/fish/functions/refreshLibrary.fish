function refreshLibrary
    lb fsadd --audio ~/lb/audio.db ~/d/80_Now_Listening/ &
    lb fsadd ~/lb/video.db ~/d/70_Now_Watching/ &
    lb fsadd ~/lb/tax.db ~/d/60_Now_Watching/ &
end
