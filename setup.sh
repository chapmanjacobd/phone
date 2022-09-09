termux-setup-storage
pkg upgrade
pkg install fish wget ffmpeg python coreutils moreutils termux-api curl openssh x11-repo mpv-x imagemagick fd socat file jq netcat-openbsd cronie
pip install --upgrade requests pip
pip install yt-dlp pypyp ipython trash-cli rich pandas catt sqlite-utils xklb

for f in ./.shortcuts/tasks/*.sh
do
  termux-fix-shebang $f
done

git clone https://github.com/adi1090x/termux-style && cd termux-style && ./install

sv-enable crond
