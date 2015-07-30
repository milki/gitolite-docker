From ubuntu
MAINTAINER milki <milki@milki.ircmylife.com>

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
RUN apt-get install -y openssh-server perl git
RUN apt-get install -y daemontools libjson-perl

RUN adduser --shell /bin/sh --disabled-password --gecos "Gitolite Test User" gtest
RUN mkdir /home/gtest/bin && mkdir /home/gtest/.ssh && chown -R gtest:gtest /home/gtest
RUN setuidgid gtest git clone git://github.com/sitaramc/gitolite /home/gtest/gitolite

# Enable gitolite testing
ENV GITOLITE_TEST y
