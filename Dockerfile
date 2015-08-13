# Dockerfile for a nodejs app container.
#
# This container provides an environment for running nodejs apps, nothing else.

FROM       d11wtq/ubuntu:14.04
MAINTAINER Chris Corbyn <chris@w3style.co.uk>

ENV NODE_VER 0.12.7
ENV NODE_PKG node-v$NODE_VER-linux-x64.tar.gz
ENV NODE_URL http://nodejs.org/dist/v$NODE_VER/$NODE_PKG

RUN cd /tmp;                           \
    curl -LO $NODE_URL;                \
    tar xvzf *.tar.gz; rm -f *.tar.gz; \
    cp -r /tmp/node-*/* /usr/local/;   \
    rm -rf /tmp/node-*
