function qr_read
    set f (mktemp --suffix .jpg)
    termux-camera-photo -c 0 $f
    zbarimg --quiet --raw $f
end
