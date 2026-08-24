# Defined in /home/xk/.config/fish/functions/git.remote.server.fish @ line 2, copied in /home/xk/.config/fish/functions/funccp.fish @ line 3
function git.remote.pakon
    git remote remove origin
    set user xk
    git remote add server ssh://$user@pakon/home/$user/github/xk/(path basename (pwd))/
    git branch --set-upstream-to=server/main main
    git fetch
end
