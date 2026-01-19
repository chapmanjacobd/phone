function tmux.kill
    for p_id in $argv
        if tmux has-session -t $p_id 2>/dev/null
            tmux kill-pane -t $p_id
        end
    end
end
