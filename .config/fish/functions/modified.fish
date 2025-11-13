# Defined interactively
function modified --wraps='git status'
    git status --porcelain --short $argv | awk 'substr($0, 1, 1) == " " && substr($0, 2, 1) == "M" {print substr($0, 4)}' | string unescape --style=script
end
