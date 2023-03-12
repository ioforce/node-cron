cd /node-cron
git config pull.rebase false
REMOTE=$(git ls-remote https://github.com/ioforce/node-cron.git HEAD | awk '{print $1}')
LOCAL=$(git rev-parse HEAD | awk '{print $1}')

if [ "$REMOTE" != "$LOCAL" ]; then
    echo "detected changes in git repository. Will run git pull, npm build and nginx reload"
    git pull
    cp /node-cron/index.html /etc/nginx/html/
    nginx -s reload
else
    echo "checking git repository. Have latest commit"
fi
