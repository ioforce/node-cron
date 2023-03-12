#node-cron (but right now without node :)

A docker container with crond that pulls a github repository and do stuff on schedule. In this case a nginx -s reload but i could also be a npm build ...
The cronjob is git pulling to the folder /node-cron

TODO:
- Only do stuff when repo actually have changes. Could be a checksum compare or dig in to git status codes.
- Support for injecting GH token or ssh rsa key
