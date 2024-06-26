# Defined via `source`
function lsof_fuser
    for pid in (fuser -m $argv &| awk '{for(i=3;i<=NF;i++){sub(/c$/,"",$i); print $i}}')
        timeout 2s lsof -p $pid &| awk '$5=="REG" && $4!="mem" && $4!="mem-r" && $4!="txt" {print}' | numfmt --field=7 --to=iec --invalid ignore
    end
end
