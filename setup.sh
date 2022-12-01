#!/bin/bash
ssh-keygen -t ed25519 -q -N '' </dev/zero
cat .ssh/id_ed25519.pub

termux-setup-storage

pkg install fish wget ffmpeg python coreutils moreutils termux-api curl openssh mpv imagemagick fd socat file jq netcat-openbsd cronie wol python-numpy micro android-tools rsync fakeroot
pip install --upgrade requests pip wheel
pip install yt-dlp pypyp ipython trash-cli rich catt sqlite-utils xklb

for f in ./.shortcuts/tasks/*.sh
do
  termux-fix-shebang $f
done

fish -c crontab

termux-open --view --content-type "application/vnd.android.package-archive" bin/moddh-1.01-release.apk

wget -nc https://github.com/termux/termux-tasker/releases/download/v0.6.0/termux-tasker_v0.6.0+github-debug.apk
wget -nc https://github.com/termux/termux-api/releases/download/v0.50.1/termux-api_v0.50.1+github-debug.apk

ln -s $PREFIX/bin/termux-clipboard-set $PREFIX/bin/xclip

# git clone https://github.com/adi1090x/termux-style && cd termux-style && ./install

adb shell pm grant net.dinglisch.android.taskerm android.permission.SET_MEDIA_KEY_LISTENER
