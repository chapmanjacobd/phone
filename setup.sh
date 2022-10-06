#!/bin/bash
termux-setup-storage
pkg upgrade
pkg install fish wget ffmpeg python coreutils moreutils termux-api curl openssh mpv imagemagick fd socat file jq netcat-openbsd cronie wol python-numpy
pip install --upgrade requests pip wheel
pip install yt-dlp pypyp ipython trash-cli rich pandas catt sqlite-utils xklb

for f in ./.shortcuts/tasks/*.sh
do
  termux-fix-shebang $f
done

fish -c crontab

termux-open --view --content-type "application/vnd.android.package-archive" bin/moddh-1.01-release.apk

# git clone https://github.com/adi1090x/termux-style && cd termux-style && ./install
