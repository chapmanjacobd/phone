function tmux.waitgroup
    set -l panes

    args.or.stdin $argv | while read -l cmd
        set -l p_id (tmux new-window -d -P -F "#{pane_id}" "$cmd")
        set -a panes $p_id
    end

    trap "tmux.kill $panes; return 1" SIGINT SIGTERM
    while set -q panes[1]
        for i in (seq (count $panes))
            set -l p_id $panes[$i]

            if not tmux has-session -t $p_id 2>/dev/null
                set -e panes[$i]
                break # Break to re-index the list
            end
        end
        sleep 0.2
    end
end
