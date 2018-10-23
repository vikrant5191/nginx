FROM ubuntu:latest
MAINTAINER xavient

USER root

RUN apt-get update

RUN apt-get install -y nginx

RUN apt-get install -y curl
# Remove the default Nginx configuration file

RUN rm -v /etc/nginx/nginx.conf

## Cocdcsspyy a configuration file from the current directory
ADD nginx.conf /etc/nginx/

ADD dist/ /usr/share/nginx/html/

#ADD chatindex.html/ /usr/share/nginx/html/

#COPY chatindexfiles/ /usr/share/nginx/html/


# Append "daemon off;" to the beginning of the configuration
RUN echo "daemon off;" >> /etc/nginx/nginx.conf



# Expose ports
EXPOSE 80
#EXPOSE 81

RUN nginx -t

CMD service nginx start

