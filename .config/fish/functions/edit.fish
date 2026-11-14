function edit
    set sp (string replace -- "$PREFIX" "$HOME/.termux/prefix" (path resolve "$argv"))

    nano "$argv"

    mkdir -p (path dirname "$sp")
    cp -p "$argv" "$sp"
end
