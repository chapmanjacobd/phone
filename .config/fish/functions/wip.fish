function wip
    if test (pwd) = /data/data/com.termux/files/home
        for func in ~/.config/fish/functions/*.fish
            fish_indent -w $func
        end
    end

    if count $argv >/dev/null
        $argv
    end

    git add .
    git --no-pager diff HEAD
    git diff --stat HEAD
    if count $argv >/dev/null; or confirm
        git commit -m wip
        git pull
        git push
    end
end
