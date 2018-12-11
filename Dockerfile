# This docker file contains build environment
FROM ubuntu:16.04
MAINTAINER Sergii Kusii <kusii.sergii@apriorit.com>

RUN apt-get update && apt-get -y upgrade
RUN apt install -y linux-image-4.15.0-32-generic linux-image-4.10.0-30-generic linux-image-4.8.0-52-generic 
RUN apt install -y linux-headers-4.4.0-103-generic linux-headers-4.13.0-39-generic
RUN rm /var/lib/apt/lists/* -rf