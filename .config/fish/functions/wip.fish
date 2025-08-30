function wip
    if test (pwd) = /data/data/com.termux/files/home
        for func in ~/.config/fish/functions/*.fish
            fish_indent -w $func
        end
    end

    if count $argv >/dev/null
        $argv
    end

    git reset
    git add .
    git --no-pager diff HEAD
    git diff --stat HEAD
    echo
    git status
    echo
    wip_message.py --staged
    if count $argv >/dev/null; or confirm
        git commit -m "$(wip_message.py --staged)"
        git pull
        git push
    end
end
