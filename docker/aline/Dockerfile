# simple centos nginx launch
FROM centos:latest
LABEL maintainer="fiberphoton@gmail.com"

RUN apt-get install nginx
RUN echo "This is your content" >> /var/www/index.html

EXPOSE 80
ENTRYPOINT /usr/bin/nginx

