# Defined in /home/xk/.config/fish/functions/gds.fish @ line 2
function gds
    git diff --staged
    git diff --staged --stat
    git status --untracked-files
    # git add --intent-to-add . &
end
