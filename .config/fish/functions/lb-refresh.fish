function lb-refresh
    lb fsadd --audio ~/lb/audio.db ~/sync/audio/ -v | grep Imported &
    lb fsadd ~/lb/video.db ~/sync/video/ -v | grep Imported &
    lb fsadd ~/lb/tax.db ~/sync/porn/video/ -v | grep Imported &
end
