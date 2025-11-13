# Defined interactively
function untracked --wraps='git status'
    git status --porcelain --short $argv | awk 'substr($0, 1, 2) == "??" {print substr($0, 4)}' | string unescape --style=script
end
