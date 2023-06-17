if status is-interactive
    bind \e\[1\;5C forward-bigword
    bind \e\[1\;5D backward-bigword
    bind \b backward-kill-bigword
    bind \cy redo

    source $__fish_config_dir/abbreviations
end

if not pgrep -f "crond" >/dev/null
    echo "[Starting crond...]" && crond && echo "[OK]"
end
