# start from base ubuntu
FROM ubuntu:16.04
MAINTAINER Sergii Kusii <kusii.sergii@apriorit.com>

# REQUIREMENTS
RUN apt-get -yqq update
RUN apt-get -yqq build-dep libguestfs
RUN apt-get -yqq install autoconf automake libtool-bin gettext
RUN apt-get -yqq install gettext po4a ocaml libfindlib-ocaml ocaml-findlib
RUN apt-get -yqq install libhivex-ocaml-dev
RUN apt-get -yqq install git

#BUILDING FROM GIT
# COPY ./install_libquestfs_ubuntu.sh /app/install_libquestfs_ubuntu.sh
# RUN chmod +x /app/install_libquestfs_ubuntu.sh 
# CMD /app/install_libquestfs_ubuntu.sh
