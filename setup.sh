termux-setup-storage
pkg upgrade
pkg install fish wget ffmpeg python coreutils moreutils termux-api curl openssh x11-repo mpv-x
pip install yt-dlp google-api-python-client pypyp ipython trash-cli joblib rich pandas python-dotenv catt sqlite-utils mutagen tinytag fuckit tabulate natsort
curl https://sdk.cloud.google.com -o sdk.sh
chmod +x ./sdk.sh && ./sdk.sh
gcloud components install gsutil
gcloud init
# gcloud auth login

for f in ./.shortcuts/tasks/*.sh
do
  termux-fix-shebang $f
done
