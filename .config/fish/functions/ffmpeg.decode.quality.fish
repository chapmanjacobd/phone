# Defined interactively
function ffmpeg.decode.quality --argument orig output
    ffmpeg -i $output -i $orig -filter_complex psnr -f null /dev/null
    ffmpeg -i $output -i $orig -filter_complex ssim -f null /dev/null
end
