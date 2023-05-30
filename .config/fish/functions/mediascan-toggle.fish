function mediascan-toggle --argument dir
    if test -e $dir/.nomedia
        rm $dir/.nomedia
    else
        touch $dir/.nomedia
    end
    termux-media-scan -r $dir
end
