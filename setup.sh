#!/bin/bash
termux-setup-storage

pkg install fish wget ffmpeg python coreutils moreutils termux-api curl openssh mpv imagemagick fd socat file jq netcat-openbsd cronie wol python-numpy android-tools rsync fakeroot ripgrep tree ncdu
pip install --upgrade requests pip wheel
pip install yt-dlp pypyp ipython rich catt sqlite-utils xklb

for f in ./.shortcuts/tasks/*.sh
do
  termux-fix-shebang $f
done

fish -c crontab

termux-open --view --content-type "application/vnd.android.package-archive" bin/moddh-1.01-release.apk

wget -nc https://github.com/termux/termux-tasker/releases/download/v0.6.0/termux-tasker_v0.6.0+github-debug.apk
wget -nc https://github.com/termux/termux-api/releases/download/v0.50.1/termux-api_v0.50.1+github-debug.apk
wget -nc https://github.com/termux/termux-widget/releases/download/v0.13.0/termux-widget_v0.13.0+github-debug.apk
wget -nc https://f-droid.org/F-Droid.apk

ln -s $PREFIX/bin/termux-clipboard-set $PREFIX/bin/xclip

rm storage/external-1

key-refresh-ssh phone

adb shell pm grant net.dinglisch.android.taskerm android.permission.SET_MEDIA_KEY_LISTENER
