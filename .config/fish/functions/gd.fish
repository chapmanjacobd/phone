# Defined interactively
function gd
    set -l diff_data (begin; git diff; git diff --stat; end | string collect)
    git add -u &
    printf '%s' $diff_data | delta --syntax-theme GitHub --max-line-length 1024
end
