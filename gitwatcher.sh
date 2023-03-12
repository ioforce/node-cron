#if /node-cron not exists

if [ ! -d "/node-cron" ]; then
 echo "cloning repository first time"
 git config --global url."https://${GITHUB_TOKEN}:@github.com/".insteadOf "https://github.com/"
 sleep 2
 git clone https://github.com/ioforce/node-cron.git /node-cron
else
 echo "repository already exists"
fi


cd /node-cron
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
