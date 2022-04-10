termux-setup-storage
pkg upgrade
pkg install fish wget ffmpeg python coreutils moreutils termux-api curl
pip install yt-dlp google-api-python-client pypyp ipython trash-cli joblib rich pandas python-dotenv catt sqlite-utils mutagen tinytag fuckit tabulate natsort
curl -L 'https://github.com/agnostic-apollo/tudo/releases/latest/download/tudo' -o "/data/data/com.termux/files/usr/bin/tudo"
echo $owner
ls -la /data/data/com.termux/files/usr/bin/
curl https://sdk.cloud.google.com | bash --override-components
gcloud components install gsutil
gcloud init
# gcloud auth login

for f in ./.shortcuts/tasks/*.sh
do
  termux-fix-shebang $f
done
