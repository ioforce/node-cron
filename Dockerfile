# production stage
FROM nginx:stable-alpine as production-stage
RUN apk add dcron git

#crontab
ADD crontab /etc/cron.d/crontab
RUN chmod 0644 /etc/cron.d/crontab
RUN crontab /etc/cron.d/crontab
RUN touch /var/log/cron.log

COPY index.html /etc/nginx/html/
COPY nginx.conf /etc/nginx/templates/nginx.conf.template
EXPOSE 4000 
CMD crond && nginx -g 'daemon off;'
