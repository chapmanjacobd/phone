function lb-refresh
    lb database add filesystem --audio ~/lb/audio.db ~/sync/audio/ -v | grep Imported &
    lb database add filesystem ~/lb/video.db ~/sync/video/ -v | grep Imported &
    lb database add filesystem ~/lb/tax.db ~/sync/porn/video/ -v | grep Imported &
end
