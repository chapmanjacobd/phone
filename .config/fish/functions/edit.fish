function edit
    set sp (path normalize ~/.termux/prefix/"$argv")

    nano $PREFIX/"$argv"

    mkdir -p (path dirname $sp)
    cp $PREFIX/"$argv" "$sp"
end
