#node-cron (but right now without node :)

A docker container with crond that pulls a github repository and do stuff on schedule. In this case a nginx -s reload but i could also be a npm build ...
The cronjob is git pulling to the folder /node-cron

Update:
Changed to use a ssh script that compares local git comit with remote commit and only do stuff if they they don´t match.
Logs will be streamed to ```localhost:4000/cron```
It takes around 20 seconds before the first cronjob runs.

TODO:
- Support for injecting GH token or ssh rsa key
