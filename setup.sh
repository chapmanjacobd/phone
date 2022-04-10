termux-setup-storage
pkg upgrade
pkg install fish wget ffmpeg python coreutils moreutils termux-api
pip install yt-dlp google-api-python-client pypyp ipython trash-cli joblib rich pandas python-dotenv catt sqlite-utils mutagen tinytag fuckit tabulate natsort
curl https://sdk.cloud.google.com | bash --override-components
gcloud components install gsutil
gcloud init
# gcloud auth login
