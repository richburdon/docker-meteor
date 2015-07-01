# Simple Dockerfile for meteor
# https://bulletproofmeteor.com/architecture/docker-and-meteor
# https://coreos.com/using-coreos/containers

# DOCKER-VERSION 1.7.0
# METEOR-VERSION 1.1.0.2
# UBUNTU-VERSION 14
FROM ubuntu:trusty

RUN apt-get update
RUN apt-get -y dist-upgrade
RUN apt-get install -y curl

# Install Meteor
RUN curl https://install.meteor.com | sh

WORKDIR /home/demo

# Install Application
ADD app app

# Install entrypoint
ADD entrypoint.sh /usr/bin/entrypoint.sh
RUN chmod +x /usr/bin/entrypoint.sh

EXPOSE 3000

# TODO(burdon): Separate dockerfile for meteor image? (since meteor install takes so long.)

# Start-up
# http://stackoverflow.com/questions/21553353/what-is-the-difference-between-cmd-and-entrypoint-in-a-dockerfile
ENTRYPOINT ["/usr/bin/entrypoint.sh"]
CMD []
