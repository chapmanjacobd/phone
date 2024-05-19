function lb-refresh
    lb fsadd --audio ~/lb/audio.db ~/sync/audio/ -v &
    lb fsadd ~/lb/video.db ~/sync/video/ -v &
    lb fsadd ~/lb/tax.db ~/sync/porn/video/ -v &
end
