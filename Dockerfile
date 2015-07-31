From ubuntu
MAINTAINER milki <milki@milki.ircmylife.com>

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
RUN apt-get install -y openssh-server perl git
RUN apt-get install -y daemontools sudo libjson-perl

RUN adduser --shell /bin/sh --disabled-password --gecos "Gitolite Test User" g3 && \
    adduser --shell /bin/sh --disabled-password --gecos "Gitolite Test User" frodo && \
    adduser --shell /bin/sh --disabled-password --gecos "Gitolite Test User" sam && \
    adduser --shell /bin/sh --disabled-password --gecos "Gitolite Test User" gollum
RUN echo "g3 ALL = (sam,frodo,gollum) NOPASSWD: ALL" >> /etc/sudoers

RUN mkdir /home/g3/bin && mkdir /home/g3/.ssh && chown -R g3:g3 /home/g3
RUN setuidgid g3 git clone --branch fix_mirror_test git://github.com/milki/gitolite /home/g3/gitolite


# Enable gitolite testing
ENV GITOLITE_TEST y
