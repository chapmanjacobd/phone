function lsof -w lsof
    command lsof $argv 2>/dev/null | grep -v DIR | numfmt --field=7 --to=iec --invalid ignore
end
