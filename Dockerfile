# This docker file contains build environment
FROM ubuntu:16.04
MAINTAINER Sergii Kusii <kusii.sergii@apriorit.com>

RUN apt-get update && apt-get upgrade

RUN rm /var/lib/apt/lists/* -rf