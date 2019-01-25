# simple Ubuntu nginx launch
FROM ubuntu:latest
LABEL maintainer="fiberphoton@gmail.com"

RUN apt-get install nginx
RUN echo "This is your content" >> /var/www/index.html

EXPOSE 80
ENTRYPOINT /usr/bin/nginx

