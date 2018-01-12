FROM ubuntu:16.04
MAINTAINER lozovsky <lozovsky@apriorit.com>

# Refresh package repostories
RUN apt-get update

# Install essential packages for building Linux kernel modules
# as well as all available kernel headers
RUN apt-get install -y \
    build-essential \
    gcc \
    linux-headers-4.4.0-109-generic \
    linux-headers-4.8.0-58-generic \
    linux-headers-4.10.0-42-generic \
    linux-headers-4.13.0-26-generic \
    sparse \
 && exit

# Remove cached packages and repository contents to conserve disk space
RUN rm -rf /var/lib/apt/lists/* /var/cache/apt/*
