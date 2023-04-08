FROM ubuntu:22.04

# Set default locale
ENV LANG C.UTF-8

# Set default timezone
ENV TZ UTC

RUN apt-get update -q \
 && apt-get install -qy --no-install-recommends \
      libgdal-dev \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

# set /app as working directory
WORKDIR /app