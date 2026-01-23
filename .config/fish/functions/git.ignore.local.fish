# Defined interactively
function git.ignore.local
    echo $argv >>.git/info/exclude
end
