# start from base ubuntu
FROM ubuntu:16.04
MAINTAINER Sergii Kusii <kusii.sergii@apriorit.com>

# REQUIREMENTS
RUN apt-get -yqq update \
    && apt-get -yqq upgrade \
    && apt-get -yqq build-dep libguestfs \
    && apt-get -yqq install autoconf automake libtool-bin \
    gettext gettext po4a ocaml libfindlib-ocaml ocaml-findlib \
    libhivex-ocaml-dev git libjansson-dev \
    && rm /var/lib/apt/lists/* -rf
