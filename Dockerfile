FROM ubuntu:latest
MAINTAINER Veerendra <veeru538@gmail.com>

# Add 10gen official apt source to the sources list
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
RUN echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | tee /etc/apt/sources.list.d/10gen.list

# Install MongoDB
RUN apt-get update
RUN apt-get install mongodb-10gen openssl

# Create the MongoDB data directory
RUN mkdir -p /data/db
RUN mkdir -p /mongodbkey
RUN openssl rand -base64 741 > /mongodbkey/keyfile
RUN chmod 600 /mongodbkey/keyfile
#VOLUME /var/backup

EXPOSE 27017
ENTRYPOINT ["usr/bin/mongod"]
