# Defined via `source`
function lines.no.empty
    rg -N "\S" $argv
end
