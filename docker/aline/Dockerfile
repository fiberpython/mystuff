# simple Ubuntu nginx launch
FROM ubuntu:latest
LABEL maintainer="fiberphoton@gmail.com"

RUN apt-get update && apt-get upgrade -y
RUN apt-get install nginx -y
RUN echo "This is your content" >> /var/www/index.html

EXPOSE 80
ENTRYPOINT /usr/bin/nginx

