FROM ubuntu:14.04

RUN apt-get update
RUN apt-get -y install software-properties-common
RUN add-apt-repository ppa:jon-severinsson/ffmpeg
RUN apt-get update
RUN apt-get -y install ffmpeg unzip imagemagick curl

# install fork of gifsicle with better lossless gif support
RUN curl -OJL https://github.com/pornel/giflossy/releases/download/lossy%2F1.82.1/gifsicle-1.82.1-lossy.zip
RUN unzip gifsicle-1.82.1-lossy.zip -d gifsicle
RUN mv gifsicle/linux/gifsicle-debian6 /usr/local/bin/gifsicle

# install iojs
RUN curl -OJL https://iojs.org/dist/v1.2.0/iojs-v1.2.0-linux-x64.tar.xz
RUN tar xf iojs-v1.2.0-linux-x64.tar.xz
RUN ln -s /iojs-v1.2.0-linux-x64/bin/node /usr/local/bin/node
RUN ln -s /iojs-v1.2.0-linux-x64/bin/iojs /usr/local/bin/iojs
RUN ln -s /iojs-v1.2.0-linux-x64/bin/npm /usr/local/bin/npm

# install gifify
RUN npm i gifify -g

# run gifify in /data (requires user to mount their source folder in /data)
WORKDIR /data

ENTRYPOINT ["gifify"]
