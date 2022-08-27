function wip
    if count $argv >/dev/null
        $argv
    end

    git add .
    git --no-pager diff HEAD
    if confirm
        git commit -m wip
        git pull
        git push
    end
end
