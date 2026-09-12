# Defined interactively
function rg.hidden
    rg -uu --hidden $argv | rg '(/\.|^\.)'
end
