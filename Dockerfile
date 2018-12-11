# This docker file contains build environment
FROM ubuntu:16.04
MAINTAINER Sergii Kusii <kusii.sergii@apriorit.com>

#old kernels from http://kernel.ubuntu.com/~kernel-ppa/mainline

RUN apt-get update && \
apt install -y linux-image-4.15.0-32-generic linux-image-4.10.0-30-generic linux-image-4.8.0-52-generic  && \
apt install -y linux-headers-4.4.0-103-generic linux-headers-4.13.0-39-generic  && \
mkdir /tmp/rs_dep && cd /tmp/rs_dep && \
apt install -y wget &&  \
wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v3.7.1-raring/linux-headers-3.7.1-030701_3.7.1-030701.201212171620_all.deb && \
wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v3.7.1-raring/linux-headers-3.7.1-030701-generic_3.7.1-030701.201212171620_amd64.deb && \
wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v3.10.103/linux-headers-3.10.103-0310103_3.10.103-0310103.201608311738_all.deb && \
wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v3.10.103/linux-headers-3.10.103-0310103-generic_3.10.103-0310103.201608311738_amd64.deb && \
wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v3.14.1-trusty/linux-headers-3.14.1-031401_3.14.1-031401.201404141220_all.deb && \
wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v3.14.1-trusty/linux-headers-3.14.1-031401-generic_3.14.1-031401.201404141220_amd64.deb && \
wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v3.16-utopic/linux-headers-3.16.0-031600_3.16.0-031600.201408031935_all.deb && \
wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v3.16-utopic/linux-headers-3.16.0-031600-generic_3.16.0-031600.201408031935_amd64.deb && \
wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v3.19-vivid/linux-headers-3.19.0-031900_3.19.0-031900.201504091832_all.deb && \
wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v3.19-vivid/linux-headers-3.19.0-031900-generic_3.19.0-031900.201504091832_amd64.deb && \
ls -1 | grep all.deb | xargs dpkg -i && ls -1 | grep amd64.deb | xargs dpkg -i && \
rm -rf /tmp/rs_dep && \
rm /var/lib/apt/lists/* -rf 