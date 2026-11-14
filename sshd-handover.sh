#!/data/data/com.termux/files/usr/bin/sh
prefix=/data/data/com.termux/files/usr
export PREFIX=$prefix
export SVDIR=$prefix/var/service
export LOGDIR=$prefix/var/log
export PATH=$prefix/bin:$PATH
log=$HOME/sshd-handover.log
{
    echo "=== $(date) handover start"
    old=$(cat "$prefix/var/run/sshd.pid" 2>/dev/null)
    if [ -n "$old" ] && kill -0 "$old" 2>/dev/null; then
        echo "stopping manual sshd pid $old"
        kill "$old"
    fi
    sleep 3
    "$prefix"/bin/sv up "$prefix/var/service/sshd"
    sleep 5
    if pgrep -x sshd >/dev/null; then
        echo "runit sshd is up"
    else
        echo "runit sshd did not start, fallback to manual sshd"
        "$prefix"/bin/sshd
    fi
    "$prefix"/bin/sv status "$prefix/var/service/sshd"
    pgrep -a sshd
    echo "=== $(date) handover done"
} >>"$log" 2>&1
