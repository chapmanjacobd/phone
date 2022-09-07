if status is-interactive
    bind \b backward-kill-bigword
end

if not pgrep -f "crond" >/dev/null
    echo "[Starting crond...]" && crond && echo "[OK]"
end
