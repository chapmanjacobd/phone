# Defined interactively
function which.pip
    pip list -v $argv | grep -i $argv | choose 2
end
