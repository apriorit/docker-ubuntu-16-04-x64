# This docker file contains build environment
FROM ubuntu:16.04
MAINTAINER bidnichenko <bidnichenko.alex@apriorit.com>

ENV DEBIAN_FRONTEND noninteractive
#uncomment all src repositories
RUN sed -i -- 's/#deb-src/deb-src/g' /etc/apt/sources.list && sed -i -- 's/# deb-src/deb-src/g' /etc/apt/sources.list

RUN apt-get update && apt-get install -y bison++ unzip libssl-dev libprocps4-dev libxalan-c-dev libxerces-c-dev libnl-3-dev \
libcrypto++-dev libcrypto++9v5 libpcre++-dev uuid-dev libsnappy-dev build-essential libboost-all-dev cmake maven libicu-dev \
zlib1g-dev liblog4cpp5-dev libncurses5-dev libselinux1-dev wget libsqlite3-dev google-mock libvirt-dev libmysqlclient-dev \
libjpeg-turbo8-dev libnuma-dev libxml2-dev qtbase5-dev qtdeclarative5-dev libgcrypt20-dev libglib2.0-dev libpixman-1-dev \
libhivex-dev libguestfs-dev libedit-dev g++-multilib

RUN wget http://nixos.org/releases/patchelf/patchelf-0.8/patchelf-0.8.tar.gz && tar xf patchelf-0.8.tar.gz && patchelf-0.8/configure && make install && rm -rf patchelf-0.8 && rm -f patchelf-0.8.tar.gz
RUN apt-get upgrade -y
RUN apt-get build-dep -y qemu-kvm
RUN apt-get install -y snapcraft
RUN apt-get install -y libelf-dev
RUN apt-get install -y git autoconf

#gRPC
RUN git clone --recursive --branch release-0_14_1 --single-branch https://github.com/grpc/grpc
RUN cd grpc && make HAS_SYSTEM_OPENSSL_NPN=false HAS_SYSTEM_OPENSSL_ALPN=false && make install prefix=/opt/grpc \
&& cd third_party/protobuf/ && make install prefix=/opt/grpc

# for sonar
RUN apt-get install -y cppcheck gcovr
RUN mkdir -p ~/sonar && wget -P ~/sonar/ https://sonarsource.bintray.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-3.0.3.778-linux.zip && unzip -o ~/sonar/sonar-scanner-cli-3.0.3.778-linux.zip -d ~/sonar/ && rm ~/sonar/sonar-scanner-cli-3.0.3.778-linux.zip
RUN PATH=$PATH:~/sonar/sonar-scanner-3.0.3.778-linux/bin
