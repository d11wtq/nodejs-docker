# Dockerfile for a nodejs app container.
#
# This container provides an environment for running nodejs apps, nothing else.

FROM       ubuntu
MAINTAINER Chris Corbyn <chris@w3style.co.uk>

RUN apt-get update -qq -y
RUN apt-get install -qq -y curl sudo git

RUN useradd -m -s /bin/bash default
RUN chgrp -R default /usr/local
RUN find /usr/local -type d | xargs chmod g+w

RUN echo "default ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/default
RUN chmod 0440 /etc/sudoers.d/default

ENV     HOME /home/default
WORKDIR /home/default
USER    default

ADD http://nodejs.org/dist/v0.10.28/node-v0.10.28-linux-x64.tar.gz /tmp/

RUN cd /tmp;                         \
    sudo chown default: *.tar.gz;    \
    tar xvzf *.tar.gz;               \
    cp -r /tmp/node-*/* /usr/local/; \
    rm -rf /tmp/node-*
