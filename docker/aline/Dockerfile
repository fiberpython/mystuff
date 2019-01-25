# simple Ubuntu nginx launch
FROM ubuntu:latest
LABEL maintainer="fiberphoton@gmail.com"

RUN apt-get update && apt-get upgrade -y
RUN apt-get install nginx -y
RUN echo "This is your content" >> /etc/nginx/index.html

EXPOSE 80
ENTRYPOINT [ "/usr/sbin/nginx -g daemon on" ]
# ENTRYPOINT /usr/bin/nginx

