# This docker file contains build environment
FROM ubuntu:16.04
MAINTAINER v.stovba <netpanik@apriorit.com>

ENV DEBIAN_FRONTEND noninteractive
#uncomment all src repositories
RUN sed -i -- 's/#deb-src/deb-src/g' /etc/apt/sources.list && sed -i -- 's/# deb-src/deb-src/g' /etc/apt/sources.list

RUN apt-get update && apt-get install -y apt-transport-https curl bison++ libssl-dev libprocps4-dev libxalan-c-dev libxerces-c-dev libnl-3-dev \
subversion libcrypto++-dev libcrypto++9v5 libpcre++-dev uuid-dev libsnappy-dev build-essential libboost-all-dev cmake maven libicu-dev \
zlib1g-dev liblog4cpp5-dev libncurses5-dev libselinux1-dev wget libsqlite3-dev google-mock libvirt-dev libmysqlclient-dev qtbase5-dev \
qtdeclarative5-dev patchelf libblkid-dev giblib-dev libimlib2-dev libglib2.0-dev libgtk-3-dev libcanberra-gtk3-dev

RUN apt-get install -y libgtest-dev
RUN cd /usr/src/gtest/ && cmake . && make && cp *.a /usr/lib

#Install MS ODBC Driver and Libraries
RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
RUN curl https://packages.microsoft.com/config/ubuntu/16.04/prod.list > /etc/apt/sources.list.d/mssql-release.list
RUN apt-get update 
RUN ACCEPT_EULA=Y apt-get install -y msodbcsql

# optional: for bcp and sqlcmd
RUN ACCEPT_EULA=Y apt-get install -y mssql-tools
RUN echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bash_profile
RUN echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bashrc
RUN source ~/.bashrc
# optional: for unixODBC development headers
RUN apt-get -y install unixodbc-dev
