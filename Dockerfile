FROM node:8

RUN echo "deb http://ftp.uk.debian.org/debian jessie-backports main" >> /etc/apt/sources.list
RUN set -ex && \
  apt-get update && \
  apt-get -y install ffmpeg unzip imagemagick curl

# install fork of gifsicle with better lossless gif support
RUN set -ex && \
  curl -OJL https://github.com/pornel/giflossy/releases/download/lossy%2F1.82.1/gifsicle-1.82.1-lossy.zip && \
  unzip gifsicle-1.82.1-lossy.zip -d gifsicle && \
  mv gifsicle/linux/gifsicle-debian6 /usr/local/bin/gifsicle

# install gifify
RUN npm i -g gifify

# run gifify in /data (requires user to mount their source folder in /data)
WORKDIR /data

ENTRYPOINT ["gifify"]
