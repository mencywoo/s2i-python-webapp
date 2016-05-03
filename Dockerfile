FROM ubuntu:14.04
MAINTAINER Docker Education Team <education@docker.com>
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y -q python-all python-pip
COPY ./.sti/bin /usr/local/sti
RUN chmod +x /usr/local/sti/*
COPY ./src/webapp/requirements.txt /tmp/requirements.txt
COPY ./src/webapp /opt/webapp/

USER default
