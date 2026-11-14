#!/data/data/com.termux/files/usr/bin/sh
# Run at device boot by Termux:Boot.

prefix=/data/data/com.termux/files/usr
export PREFIX=$prefix
export SVDIR=$prefix/var/service
export LOGDIR=$prefix/var/log
export PATH=$prefix/bin:$PATH

# Keep Android/HyperOS from freezing the Termux process tree while sshd is
# running in the background (no matching termux-wake-unlock on purpose).
termux-wake-lock

# Start the termux-services supervisor. It starts every enabled service
# (sshd is enabled with sv-enable; check with: sv status sshd).
"$prefix"/bin/service-daemon start

# crond has no enabled runit service, so start it directly if it is missing.
pgrep -x crond >/dev/null || "$prefix"/bin/crond
