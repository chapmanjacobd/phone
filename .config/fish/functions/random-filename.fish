function random-filename
    set f (path change-extension '' "$argv")
    set ext (path extension "$argv")
    mktemp --dry-run $f.XXXXX --suffix=$ext
end
