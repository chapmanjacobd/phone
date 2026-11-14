#!/data/data/com.termux/files/usr/bin/sh
# Run at device boot by Termux:Boot. Logs to ~/.termux/boot/boot.log so that
# the boot path can be verified after a reboot.

prefix=/data/data/com.termux/files/usr
home=/data/data/com.termux/files/home
export PREFIX=$prefix
export SVDIR=$prefix/var/service
export LOGDIR=$prefix/var/log
export PATH=$prefix/bin:$PATH

exec >>"$home/.termux/boot/boot.log" 2>&1
echo "=== boot script $(date) ==="

# Keep Android/HyperOS from freezing the Termux process tree while sshd is
# running in the background (no matching termux-wake-unlock on purpose).
termux-wake-lock

# Start the termux-services supervisor. It starts every enabled service
# (sshd and crond are enabled with sv-enable; check with: sv status sshd).
"$prefix"/bin/service-daemon start
