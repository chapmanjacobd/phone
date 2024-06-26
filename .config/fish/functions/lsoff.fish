function lsoff -a mnt -a dir
    command lsof "$mnt" 2>/dev/null | grep "$dir" | grep -v DIR | numfmt --field=7 --to=iec --invalid ignore
end
