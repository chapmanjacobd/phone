function gitignore
    echo "$argv" | tee -a .gitignore
    if confirm 'git reset?'
        git reset -- :/"$argv"
        if confirm 'git rm --cached; git commit?'
            git rm --cached "$argv"
            git commit -m wip
        end
    end
end
